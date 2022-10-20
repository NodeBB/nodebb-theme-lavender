$('document').ready(function() {
	setupTaskbar();
	setupMobileMenu();

	require([
		'masonry-layout',
		'imagesloaded',
	], function(Masonry, imagesLoaded) {
		var fixed = localStorage.getItem('fixed') || 1;
		var masonry;
		var masonryCalled = false;

		function doMasonry() {
			masonryCalled = true;
			if ($('.masonry').length) {
				masonry = new Masonry('.masonry', {
					itemSelector: '.category-item',
					columnWidth: '.category-item:not(.col-lg-12)',
					transitionDuration: 0,
					isInitLayout: false,
					isOriginLeft: $('html').attr('data-dir') === 'ltr',
				});

				$('.row.categories > div p img').imagesLoaded(function() {
					masonry.layout();
				});

				var saved = JSON.parse(localStorage.getItem('masonry:layout'));
				if (saved) {
					for (var cid in saved) {
						if (saved.hasOwnProperty(cid)) {
							var category = saved[cid];

							$('.category-item[data-cid="' + cid + '"]').css({
								left: category.left,
								top: category.top,
								position: 'absolute'
							});
						}
					}
				}

				masonry.on('layoutComplete', function() {
					var saved = {};

					$('.category-item').each(function() {
						var $this = $(this);

						saved[$this.attr('data-cid')] = {
							left: $this.css('left'),
							top: $this.css('top'),
						};
					});

					localStorage.setItem('masonry:layout', JSON.stringify(saved));
				});
			}
		}

		function resize(fixed) {
			fixed = parseInt(fixed, 10);

			var container = fixed ? $('.container-fluid') : $('.container');
			container.toggleClass('container-fluid', fixed !== 1).toggleClass('container', fixed === 1);
			localStorage.setItem('fixed', fixed);
		}

		resize(fixed);

		$(window).on('action:ajaxify.end', function(ev, data) {
			var url = data.url;

			if(!/^admin\//.test(data.url) && !/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
				doMasonry();
				if ($('.categories').length) {
					$('.category-header .badge i').tooltip();
				}
			}
		});

		if (!$('.admin').length) {
			setupResizer();
		}

		$(window).on('action:posts.loaded', function() {
			doMasonry();
		});

		if ($('.masonry').length && !masonryCalled) {
			doMasonry();
		}

		function setupResizer() {
			var div = $('<div class="overlay-container"><div class="card resizer pointer"><div class="card-body"><i class="fa fa-arrows-h fa-2x"></i></div></div></div>');

			div.css({
				position:'fixed',
				bottom: '20px',
				right: '20px'
			}).hide().appendTo(document.body);

			$(window).on('mousemove', function(ev) {
				if (ev.clientX > $(window).width() - 150 && ev.clientY > $(window).height() - 150) {
					div.fadeIn();
				} else {
					div.stop(true, true).fadeOut();
				}
			});

			div.find('.resizer').on('click', function() {
				fixed = parseInt(fixed, 10) === 1 ? 0 : 1;
				resize(fixed);
				doMasonry();
			});
		}
	});


	$(window).on('action:ajaxify.start', function() {
		if ($('.navbar .navbar-collapse').hasClass('in')) {
			$('.navbar-header button').click();
		}
	});

	function setupTaskbar() {
		require(['hooks'], (hooks) => {
			hooks.on('filter:taskbar.push', (data) => {
				data.options.className = 'taskbar-' + data.module;
				if (data.module === 'composer') {
					data.options.icon = 'fa-commenting-o';
				} else if (data.module === 'chat') {
					if (data.element.length && !data.element.hasClass('active')) {
						increaseChatCount(data.element);
					}
				}
			});
			hooks.on('action:taskbar.pushed', (data) => {
				if (data.module === 'chat') {
					createChatIcon(data);
					var elData = data.element.data();
					if (elData && elData.options && !elData.options.isSelf) {
						increaseChatCount(data.element);
					}
				}
			});
		});

		socket.on('event:chats.markedAsRead', function (data) {
			$('#taskbar [data-roomid="' + data.roomId + '"]')
				.removeClass('new')
				.attr('data-content', 0);
		});

		function createChatIcon(data) {
			$.getJSON(config.relative_path + '/api/user/' + app.user.userslug + '/chats/' + data.options.roomId, function (chatObj) {
				var el = $('#taskbar [data-uuid="' + data.uuid + '"] a');
				el.parent('[data-uuid]').attr('data-roomId', data.options.roomId);

				if (chatObj.users.length === 1) {
					var user = chatObj.users[0];
					el.find('i').remove();

					if (user.picture) {
						el.css('background-image', 'url(' + user.picture + ')');
						el.css('background-size', 'cover');
					} else {
						el.css('background-color', user['icon:bgColor'])
							.text(user['icon:text'])
							.addClass('avatar');
					}
				}
			});
		}

		function increaseChatCount(el) {
			var count = (parseInt($(el).attr('data-content'), 10) || 0) + 1;
			$(el).attr('data-content', count);
		}
	}

	function setupMobileMenu() {
		if (!window.addEventListener) {
			return;
		}

		require(['pulling/build/pulling-drawer', 'storage', 'alerts', 'search'], function (Pulling, Storage, alerts, search) {
			if (!Pulling) {
				return;
			}

			// initialization

			var chatMenuVisible = app.user && parseInt(app.user.uid, 10);
			var swapped = !!Storage.getItem('persona:menus:legacy-layout');
			var margin = window.innerWidth;

			if (swapped) {
				$('#mobile-menu').removeClass('float-start');
				$('#mobile-chats').addClass('float-start');
			}

			if (document.documentElement.getAttribute('data-dir') === 'rtl') {
				swapped = !swapped;
			}

			var navSlideout = Pulling.create({
				panel: document.getElementById('panel'),
				menu: document.getElementById('menu'),
				width: 256,
				margin: margin,
				side: swapped ? 'right' : 'left',
			});
			$('#menu').removeClass('hidden');

			var chatsSlideout;
			if (chatMenuVisible) {
				chatsSlideout = Pulling.create({
					panel: document.getElementById('panel'),
					menu: document.getElementById('chats-menu'),
					width: 256,
					margin: margin,
					side: swapped ? 'left' : 'right',
				});
				$('#chats-menu').removeClass('hidden');
			}

			// all menus

			function closeOnClick() {
				navSlideout.close();
				if (chatsSlideout) { chatsSlideout.close(); }
			}

			function onBeforeOpen() {
				document.documentElement.classList.add('slideout-open');
			}

			function onClose() {
				$('#mobile-menu').blur();
				document.documentElement.classList.remove('slideout-open');
				$('#panel').off('click', closeOnClick);
			}

			$(window).on('resize action:ajaxify.start', function () {
				navSlideout.close();
				if (chatsSlideout) {
					chatsSlideout.close();
				}
			});

			navSlideout
				.ignore('code, code *, .preventSlideout, .preventSlideout *')
				.on('closed', onClose)
				.on('beforeopen', onBeforeOpen)
				.on('opened', function () {
					$('#panel').one('click', closeOnClick);
				});

			if (chatMenuVisible) {
				chatsSlideout
					.ignore('code, code *, .preventSlideout, .preventSlideout *')
					.on('closed', onClose)
					.on('beforeopen', onBeforeOpen)
					.on('opened', function () {
						$('#panel').one('click', closeOnClick);
					});
			}

			// left slideout navigation menu

			$('#mobile-menu').on('click', function () {
				navSlideout.enable().toggle();
			});

			if (chatMenuVisible) {
				navSlideout.on('beforeopen', function () {
					chatsSlideout.close();
					chatsSlideout.disable();
				}).on('closed', function () {
					chatsSlideout.enable();
				});
			}

			$('#menu [data-section="navigation"] ul').html(
				$('#main-nav').html() +
				($('#logged-out-menu').html() || '')
			);

			$('#user-control-list').children().clone(true, true).appendTo($('#chats-menu [data-section="profile"] ul'));

			socket.on('event:user_status_change', function (data) {
				if (parseInt(data.uid, 10) === app.user.uid) {
					app.updateUserStatus($('#chats-menu [component="user/status"]'), data.status);
					navSlideout.close();
				}
			});

			// right slideout notifications & chats menu

			function loadNotificationsAndChats() {
				require(['notifications', 'chat'], function (notifications, chat) {
					const notifList = $('#chats-menu [data-section="notifications"] ul');
					notifications.loadNotifications(notifList, function () {
						notifList.find('.deco-none').removeClass('deco-none');
						chat.loadChatsDropdown($('#chats-menu .chat-list'));
					});
				});
			}

			if (chatMenuVisible) {
				$('#mobile-chats').removeClass('hidden').on('click', function () {
					navSlideout.close();
					chatsSlideout.enable().toggle();
				});
				$('#chats-menu').on('click', 'li[data-roomid]', function () {
					chatsSlideout.close();
				});

				chatsSlideout
					.on('opened', loadNotificationsAndChats)
					.on('beforeopen', function () {
						navSlideout.close().disable();
					})
					.on('closed', function () {
						navSlideout.enable();
					});
			}

			const searchInputEl = $('.navbar .navbar-search input[name="term"]');
			const searchButton = $('.navbar .navbar-search button[type="button"]');
			searchButton.off('click').on('click', function () {
				if (!config.loggedIn && !app.user.privileges['search:content']) {
					alerts.alert({
						message: '[[error:search-requires-login]]',
						timeout: 3000,
					});
					ajaxify.go('login');
					return false;
				}

				searchButton.addClass('hidden');
				searchInputEl.removeClass('hidden').focus();
				return false;
			});
			searchInputEl.on('blur', function () {
				searchInputEl.addClass('hidden');
				searchButton.removeClass('hidden');
			});
			search.enableQuickSearch({
				searchElements: {
					inputEl: searchInputEl,
					resultEl: $('.navbar .navbar-search .quick-search-container'),
				},
				searchOptions: {
					in: config.searchDefaultInQuick,
				},
			});
		});
	}
});
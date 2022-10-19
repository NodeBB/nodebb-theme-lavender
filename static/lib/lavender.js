$('document').ready(function() {
	setupTaskbar();

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


	var loadingBar = $('.loading-bar');

	$(window).on('action:ajaxify.start', function(data) {
		loadingBar.fadeIn(0).removeClass('reset');
	});

	$(window).on('action:ajaxify.loadingTemplates', function() {
		loadingBar.css('width', '90%');
	});

	$(window).on('action:ajaxify.contentLoaded', function() {
		loadingBar.css('width', '100%');
		setTimeout(function() {
			loadingBar.fadeOut(250);

			setTimeout(function() {
				loadingBar.addClass('reset').css('width', '0%');
			}, 250);
		}, 750);
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
});
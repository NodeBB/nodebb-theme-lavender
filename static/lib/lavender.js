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
		require(['persona/taskbar'], function (taskbar) {
			taskbar.init();
		});
	}

	function setupMobileMenu() {
		require(['persona/mobile-menu'], function (mobileMenu) {
			mobileMenu.init();
		});
	}
});
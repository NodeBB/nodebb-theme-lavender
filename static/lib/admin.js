
'use strict';

define('admin/plugins/lavender', ['settings'], function (Settings) {
	const ACP = {};

	ACP.init = function () {
		Settings.load('lavender', $('.lavender-settings'));

		$('#save').on('click', function () {
			Settings.save('lavender', $('.lavender-settings'));
		});
	};

	return ACP;
});
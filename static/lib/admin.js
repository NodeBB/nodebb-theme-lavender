
'use strict';

define('admin/plugins/lavender', ['admin/settings'], function (Settings) {
	const ACP = {};

	ACP.init = function () {
		Settings.prepare();
	};

	return ACP;
});
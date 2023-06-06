"use strict";

const path = require('path');

const meta = require.main.require('./src/meta');
const nconf = require.main.require('nconf');

const theme = module.exports;

theme.defineWidgetAreas = async function(areas) {
	const locations = ['header', 'sidebar', 'footer'];
	const templates = [
		'categories.tpl', 'category.tpl', 'topic.tpl', 'users.tpl',
		'unread.tpl', 'recent.tpl', 'popular.tpl', 'top.tpl', 'tags.tpl', 'tag.tpl',
		'login.tpl', 'register.tpl',
	];
	function capitalizeFirst(str) {
		return str.charAt(0).toUpperCase() + str.slice(1);
	}
	templates.forEach((template) => {
		locations.forEach((location) => {
			areas.push({
				name: `${capitalizeFirst(template.split('.')[0])} ${capitalizeFirst(location)}`,
				template: template,
				location: location,
			});
		});
	});

	areas = areas.concat([
		{
			name: 'Account Header',
			template: 'account/profile.tpl',
			location: 'header',
		},
	]);
	return areas;
};

theme.preinit = function (params, callback) {
	nconf.set('base_templates_path', path.join(nconf.get('themes_path'), 'nodebb-theme-persona/templates'));

	callback();
};

theme.init = function (params, callback) {
	const routeHelpers = require.main.require('./src/routes/helpers');
	routeHelpers.setupAdminPageRoute(params.router, '/admin/plugins/lavender', function (req, res, next) {
		res.render('admin/plugins/lavender', {
			title: 'Lavender Theme',
		});
	});

	callback();
};

theme.addAdminNavigation = function(header, callback) {
	header.plugins.push({
		route: '/plugins/lavender',
		icon: 'fa-paint-brush',
		name: 'Lavender Theme'
	});

	callback(null, header);
};

theme.getConfig = async function (config) {
	const settings = await meta.settings.get('lavender');
	config.disableMasonry = settings.disableMasonry === 'on';
	config.enableQuickReply = settings.enableQuickReply === 'on';
	return config;
};

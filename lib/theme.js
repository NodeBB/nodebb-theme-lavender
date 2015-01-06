(function(module) {
	"use strict";

	var Theme = {};
	var winston = require('winston');

	Theme.defineWidgetAreas = function(areas, callback) {
		areas = areas.concat([
			{
				'name': 'Homepage Sidebar',
				'template': 'home.tpl',
				'location': 'sidebar'
			},
			{
				'name': 'Category Sidebar',
				'template': 'category.tpl',
				'location': 'sidebar'
			}
		]);

		callback(null, areas);
	};

	Theme.buildHeader = function(header, callback){
		winston.info('[theme.seo]', header);
		callback(null, header);
	}

	module.exports = Theme;

}(module));
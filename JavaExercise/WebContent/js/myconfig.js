/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.language = 'zh-cn';
    config.height = 100;
    config.toolbar = 'Full';
    config.toolbar_Full = [['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar']];
    config.removePlugins = 'elementspath';
};

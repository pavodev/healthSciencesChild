<?php

/**
 * @file DefaultChildThemePlugin.php
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class DefaultChildThemePlugin
 * @brief Example child theme plugin
 */

namespace APP\plugins\themes\healthSciencesChild;

use PKP\plugins\ThemePlugin;

class HealthSciencesChildThemePlugin extends ThemePlugin
{
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init()
	{
		$this->setParent('healthsciencesthemeplugin');
		$this->modifyStyle('stylesheet', ['addLess' => ['styles/index.less']]);
		$this->addScript('javascript', 'js/navigationMenu.js');
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	public function getDisplayName()
	{
		return __('plugins.themes.healthSciencesChild.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	public function getDescription()
	{
		return __('plugins.themes.healthSciencesChild.description');
	}
}

if (!PKP_STRICT_MODE) {
	class_alias('\APP\plugins\themes\healthSciencesChild\HealthSciencesChildThemePlugin', '\HealthSciencesChildThemePlugin');
}

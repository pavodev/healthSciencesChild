{**
 * templates/frontend/components/languageSwitcher.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief A re-usable template for displaying a language switcher dropdown.
 *
 * @uses $currentLocale string Locale key for the locale being displayed
 * @uses $languageToggleLocales array All supported locales
 * @uses $id string A unique ID for this language toggle
 *}
{if $languageToggleLocales && $languageToggleLocales|@count > 1}
{if !$isMobile}
<div class="navigation__container navigation__container--user" id="userNav">
	<div class="column large-2">
		<h3 class="bottom_line0 dropdown">
			<a href="#"
			class="nav-link dropdown-toggle"
			id="navMenuDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			{$languageToggleLocales[$currentLocale]}
				<i class="icon_container0">
					<svg class="icon0 icon-drop-down ">
						<use xlink:href="#drop-down"></use>
					</svg>
				</i>
				<span class="bottom_bar0"></span>
			</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="{'navMenuDropdown'|concat:$field}">
					<div class="dropdown-menu__container">
						{foreach from=$languageToggleLocales item="localeName" key="localeKey"}
							{if $localeKey !== $currentLocale}
								<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
									{$localeName}
								</a>
							{/if}
						{/foreach}
					</div>
				</div>
		</h3>
	</div>
</div>
{else}
<div class="navigation__container navigation__container--user" id="userNavMobile">
	<div class="column large-2">
		<h3 class="bottom_line0 dropdown">
			<a href="#"
			class="nav-link dropdown-toggle"
			id="navMenuDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				{translate key="plugins.themes.healthSciencesChild.language"}{$languageToggleLocales[$currentLocale]}
				<i class="icon_container0">
					<svg class="icon0 icon-drop-down ">
						<use xlink:href="#drop-down"></use>
					</svg>
				</i>
				<span class="bottom_bar0"></span>
			</a>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="{'navMenuDropdown'|concat:$field}">
					<div class="dropdown-menu__container">
						{foreach from=$languageToggleLocales item="localeName" key="localeKey"}
							{if $localeKey !== $currentLocale}
								<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
									{$localeName}
								</a>
							{/if}
						{/foreach}
					</div>
				</div>
		</h3>
	</div>
</div>
{/if}


		
	{* <div id="{$id|escape}" class="dropdown language-toggle">
		<button class="btn dropdown-toggle" type="button" id="languageToggleMenu{$id|escape}" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			<span class="visually-hidden">{translate key="plugins.themes.healthSciences.language.toggle"}</span>
			{$languageToggleLocales[$currentLocale]}
		</button>
		<div class="dropdown-menu" aria-labelledby="languageToggleMenu{$id|escape}">
			{foreach from=$languageToggleLocales item="localeName" key="localeKey"}
				{if $localeKey !== $currentLocale}
					<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
						{$localeName}
					</a>
				{/if}
			{/foreach}
		</div>
	</div> *}
{/if}

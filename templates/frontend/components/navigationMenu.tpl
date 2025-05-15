{**
 * HEALTH SCIENCES CHILD THEME
 *
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Navigation menu template
 *
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}

{** ORIGINAL
{if $navigationMenu}
	<ul id="{$id|escape}" class="{$ulClass|escape}">
		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				{continue}
			{/if}
			{assign var="hasChildren" value=false}
			{if !empty($navigationMenuItemAssignment->children)}
				{assign var="hasChildren" value=true}
			{/if}
			<li class="{$liClass|escape} {$navigationMenuItemAssignment->navigationMenuItem->getType()|lower}{if $hasChildren} dropdown{/if}">
				<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}"
					class="nav-link{if $hasChildren} dropdown-toggle{/if}"
					{if $hasChildren}
						id="{'navMenuDropdown'|concat:$field}"
						data-bs-toggle="dropdown"
						aria-haspopup="true"
						aria-expanded="false"
					{/if}
				>
					{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
				</a>
				{if $hasChildren}
					<div class="dropdown-menu{if $id === 'userNav'} dropdown-menu-right{/if}" aria-labelledby="{'navMenuDropdown'|concat:$field}">
						{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
							{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
								<a class="dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
									{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
								</a>
							{/if}
						{/foreach}
					</div>
				{/if}
			</li>
		{/foreach}
	</ul>
{/if}
*}

{** CUSTOM *}
{if $navigationMenu}
	{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
		{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
			{continue}
		{/if}

		{if $id === 'userNav'}
			{continue}
		{/if}
		<div class="navigation__container {if $id === 'userNav'}{"navigation__container--user"}{/if}{if $isUserLoggedIn}{" logged"}{else}{" notlogged"}{/if}" id="{if $id === 'userNav'}{$id}{/if}">
			{assign var="hasChildren" value=false}
			{if !empty($navigationMenuItemAssignment->children)}
				{assign var="hasChildren" value=true}
			{/if}
			<div class="column large-2">
				<h3 class="bottom_line0 {$liClass|escape} {$navigationMenuItemAssignment->navigationMenuItem->getType()|lower}{if $hasChildren} dropdown{/if}">
					<a href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}"
					class="nav-link{if $hasChildren} dropdown-toggle{/if}"
					{if $hasChildren} id="{'navMenuDropdown'|concat:$field}" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"{/if}>
						{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
						{if $hasChildren}
						<i class="icon_container0">
							<svg class="icon0 icon-drop-down ">
								<use xlink:href="#drop-down"></use>
							</svg>
						</i>
						{/if}
						<span class="bottom_bar0"></span>
					</a>
					{if $hasChildren}
						<div class="dropdown-menu{if $id === 'userNav'} dropdown-menu-right{/if}" aria-labelledby="{'navMenuDropdown'|concat:$field}">
							<div class="dropdown-menu__container">
								{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
									{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
										<a class="dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
										</a>
									{/if}
								{/foreach}
							</div>
						</div>
					{/if}
				</h3>
			</div>
		</div>
	{/foreach}
{/if}
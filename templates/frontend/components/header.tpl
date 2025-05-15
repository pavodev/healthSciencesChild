{**
 * HEALTH SCIENCES CHILD THEME
 *
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if !$displayPageHeaderLogo}
	{assign var="showingLogo" value=false}
{/if}

{capture assign="homeUrl"}
	{url page="index" router=$smarty.const.ROUTE_PAGE}
{/capture}

{if $currentContext}
  {assign var="journalUrl"
           value=$baseUrl|cat:"/index.php/"|cat:$currentContext->getPath()}
{else}
  {assign var="journalUrl" value=$baseUrl}
{/if}

{if $currentContext}
  {assign var="adminUrl"
           value=$baseUrl|cat:"/index.php/index"}
{else}
  {assign var="adminUrl" value=$baseUrl}
{/if}

{* Logo or site title. Only use <h1> heading on the homepage.
	 Otherwise that should go to the page title. *}
{if $requestedOp == 'index'}
	{assign var="siteNameTag" value="h1"}
{else}
	{assign var="siteNameTag" value="div"}
{/if}

{* Determine whether to show a logo of site title *}
{capture assign="brand"}{strip}
	{if $displayPageHeaderLogo}
		<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"
		     {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"
		     {else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if}
				 class="img-fluid">
	{elseif $displayPageHeaderTitle}
		<span class="navbar-logo-text">{$displayPageHeaderTitle|escape}</span>
	{else}
		<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" class="img-fluid">
	{/if}
{/strip}{/capture}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body dir="{$currentLocaleLangDir|escape|default:"ltr"}">

{* Header *}
<header class="main-header">
	<div class="logo_bar0"></div>
	<div class="navbar">
		<{$siteNameTag} class="visually-hidden">{$pageTitleTranslated|escape}</{$siteNameTag}>
		<div class="navbar__upper">
			<div id="header-usi" class="col-sm-5">
				<div id="header-usi-content" class="row fixText">
					<a id="usi-bollo" class="fixTextSpace" href="{$homeUrl}">{$brand}</a>
					<div id="usi-nome" class="col-md-7 col-sm-7 col-xs-12">
						<a id="usi-nome-link" href="{$homeUrl}"></a>
						<span>Università</span>
						<span>della</span>
						<span>Svizzera</span>
						<span>italiana</span>
					</div>
				</div>
			</div>

			<div class="navbar__submenu">
			{* Language switcher *}
			{include file="frontend/components/languageSwitcher.tpl" id="languageSmallNav"}

			{* Logged in navigation *}

			{if $isUserLoggedIn}
				<div class="navigation__container navigation__container--user logged" id="userNav">
					<div class="column large-2">
						<h3 class="bottom_line0 nav-item nmi_type_user_dashboard dropdown">
							<a href="{$journalUrl}/submissions" class="nav-link dropdown-toggle" id="navMenuDropdown2" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
								{$currentUser->getUsername()}
								<span class="badge badge-light">
									{$unreadNotificationCount}
								</span>
								<i class="icon_container0">
								<svg class="icon0 icon-drop-down ">
									<use xlink:href="#drop-down"></use>
								</svg>
								</i>
							</a>
							<span class="bottom_bar0 active"></span>
							<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navMenuDropdown2" data-bs-popper="static">
								<a class="dropdown-item" href="{$journalUrl}/submissions">{translate key="plugins.themes.healthSciencesChild.dashboard"} <span class="badge badge-light">
									{$unreadNotificationCount}
								</span></a>
								<a class="dropdown-item" href="{$journalUrl}/user/profile">{translate key="plugins.themes.healthSciencesChild.viewprofile"}</a>
								<a class="dropdown-item" href="{$adminUrl}/admin/index">{translate key="plugins.themes.healthSciencesChild.administration"}</a>
								<a class="dropdown-item" href="{$journalUrl}/login/signOut">Logout</a>
							</div>
						</h3>
					</div>
				</div>
			{else}
				{* Logged out navigation *}
				<div class="navigation__container navigation__container--user notlogged" id="userNav">
					<div class="column large-2">
						<h3 class="bottom_line0 nav-item nmi_type_user_register">
							<a href="{$journalUrl}/user/register" class="nav-link">Register</a>
							<span class="bottom_bar0 active"></span>
						</h3>
					</div>
				</div>

				<div class="navigation__container navigation__container--user notlogged" id="userNav">
					<div class="column large-2">
						<h3 class="bottom_line0 nav-item nmi_type_user_login">
							<a href="{$journalUrl}/login" class="nav-link">Login</a>
							<span class="bottom_bar0"></span>
						</h3>
					</div>
				</div>
			{/if}
			</div>
		</div>

		{* Sub header *}
		<div class="header__sub">
			<div class="header__sub-content">
				<div class="row">
					<div class="column small-12 large-push-2">
						<div class="header__sub-title"><a href="/">{translate key="plugins.themes.healthSciencesChild.peerreview"}</a></div>
						<div class="header__sub-subtitle">{translate key="plugins.themes.healthSciencesChild.peerreviewdescription"}</div>
					</div>
				</div>
			</div>
		</div>

		{* Main navigation *}
		<nav class="navigation__primary navbar navbar-expand-lg navbar-light service-menu">
			{* <a class="navbar-brand" href="{$homeUrl}">{$brand}</a> *}
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-navbar"
							aria-controls="main-navbar" aria-expanded="false"
							aria-label="{translate key="plugins.themes.healthSciences.nav.toggle"}">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="main-navbar">
				<div class="navbar-collapse__buttons">
					<button type="button" class="navbar-collapse__button" aria-label="Close"
						data-bs-toggle="collapse" data-bs-target="#main-navbar">&#x2715;</button>
				</div>
				<div class="navbar-collapse__bar--container"><div class="navbar-collapse__bar--line"></div></div>
				{* primary menu *}
				{capture assign="primaryMenu"}
					{load_menu name="primary" id="primaryNav" ulClass="navbar-nav" liClass="nav-item"}
				{/capture}
				{if !empty(trim($primaryMenu)) || $currentContext}
					{$primaryMenu}
				{/if}
				{* user menu *}
				<div id="userNavMobile">
				{load_menu name="user" id="primaryNav-userNav" ulClass="navbar-nav" liClass="nav-item"}
				</div>
				{include file="frontend/components/languageSwitcher.tpl" id="languageSmallNav" isMobile=true}
			</div>
		</nav>

		{* Repeat the userNav for positioning on large screens *}
		{load_menu name="user" id="userNav" ulClass="navbar-nav" liClass="nav-item"}

		{* Language switcher *}
		{* {include file="frontend/components/languageSwitcher.tpl" id="languageLargeNav"} *}
	</div>
	<svg style="display: none;">
		<symbol id="drop-down" viewBox="0 0 50 50"><path d="M0 24.4L1.4 23 25 47.2 48.6 23l1.4 1.4L25 50z"></path>
	</svg>
</header>

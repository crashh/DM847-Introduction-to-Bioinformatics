



<!DOCTYPE html>
<html lang="en" class=" is-copy-enabled is-u2f-enabled">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=1020">
    <meta content="origin-when-cross-origin" name="referrer" />
    
    <title>DM847-Introduction-to-Bioinformatics/random_forest_fold.R at master · crashh/DM847-Introduction-to-Bioinformatics</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="crashh/DM847-Introduction-to-Bioinformatics" name="twitter:title" /><meta content="DM847-Introduction-to-Bioinformatics - Assignments from DM847." name="twitter:description" /><meta content="https://avatars2.githubusercontent.com/u/6775794?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars2.githubusercontent.com/u/6775794?v=3&amp;s=400" property="og:image" /><meta content="crashh/DM847-Introduction-to-Bioinformatics" property="og:title" /><meta content="https://github.com/crashh/DM847-Introduction-to-Bioinformatics" property="og:url" /><meta content="DM847-Introduction-to-Bioinformatics - Assignments from DM847." property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="web-socket" href="wss://live.github.com/_sockets/Njc3NTc5NDoxN2VjOTcxMDRlMTg4ZTRlNDhjYzIyY2U2MDUwOTVmMzozMzFhZjhkZWI1YzQyNzQxNGI3NTMyZDFlYWMzYjU2NjQ4MGJlZDgzOWRhMDFlNDcyZDUyYzAzZGQzYTE5OGY0--da7829ee4e5c4acce67c39f23166c496d28eeff9">
    <meta name="pjax-timeout" content="1000">
    <link rel="sudo-modal" href="/sessions/sudo_modal">

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>

    <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="026E2E5F:4488:14B1C786:5677FECD" name="octolytics-dimension-request_id" /><meta content="6775794" name="octolytics-actor-id" /><meta content="crashh" name="octolytics-actor-login" /><meta content="0e312eaf5099561f904f85c11f34057833776294be503190e86bb9f20a6c4349" name="octolytics-actor-hash" />
<meta content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" name="analytics-location" />
<meta content="Rails, view, blob#show" data-pjax-transient="true" name="analytics-event" />


  <meta class="js-ga-set" name="dimension1" content="Logged In">



        <meta name="hostname" content="github.com">
    <meta name="user-login" content="crashh">

        <meta name="expected-hostname" content="github.com">

      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

    <meta content="91347a826128a798d94be0d8a44dcb66c377cc9f" name="form-nonce" />

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-2cf579a6b28dd247fe7895e0539371525ae8c3bf4e52e45e893bb6b09ee597df.css" integrity="sha256-LPV5prKN0kf+eJXgU5NxUlrow79OUuReiTu2sJ7ll98=" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github2-4280061368be57917309c32e14e922e1b4575c8e586c5aa9f6feeb11280c7a2f.css" integrity="sha256-QoAGE2i+V5FzCcMuFOki4bRXXI5YbFqp9v7rESgMei8=" media="all" rel="stylesheet" />
    
    


    <meta http-equiv="x-pjax-version" content="e884612b86c6e4ec31651647e12e417b">

      
  <meta name="description" content="DM847-Introduction-to-Bioinformatics - Assignments from DM847.">
  <meta name="go-import" content="github.com/crashh/DM847-Introduction-to-Bioinformatics git https://github.com/crashh/DM847-Introduction-to-Bioinformatics.git">

  <meta content="6775794" name="octolytics-dimension-user_id" /><meta content="crashh" name="octolytics-dimension-user_login" /><meta content="42037188" name="octolytics-dimension-repository_id" /><meta content="crashh/DM847-Introduction-to-Bioinformatics" name="octolytics-dimension-repository_nwo" /><meta content="false" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="42037188" name="octolytics-dimension-repository_network_root_id" /><meta content="crashh/DM847-Introduction-to-Bioinformatics" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/crashh/DM847-Introduction-to-Bioinformatics/commits/master.atom?token=AGdj8rFd_pH3jt9ZrZdQn0tEULQTxMKaks60hTFXwA%3D%3D" rel="alternate" title="Recent Commits to DM847-Introduction-to-Bioinformatics:master" type="application/atom+xml">

  </head>


  <body class="logged_in   env-production linux vis-private page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>

    
    
    



      <div class="header header-logged-in true" role="banner">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" data-ga-click="Header, go to dashboard, icon:logo">
  <span class="mega-octicon octicon-mark-github "></span>
</a>


      <div class="site-search repo-scope js-site-search" role="search">
          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/crashh/DM847-Introduction-to-Bioinformatics/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/crashh/DM847-Introduction-to-Bioinformatics/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <label class="js-chromeless-input-container form-control">
    <div class="scope-badge">This repository</div>
    <input type="text"
      class="js-site-search-focus js-site-search-field is-clearable chromeless-input"
      data-hotkey="s"
      name="q"
      placeholder="Search"
      aria-label="Search this repository"
      data-global-scope-placeholder="Search GitHub"
      data-repo-scope-placeholder="Search"
      tabindex="1"
      autocapitalize="off">
  </label>
</form>
      </div>

      <ul class="header-nav left" role="navigation">
        <li class="header-nav-item">
          <a href="/pulls" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:pulls context:user" data-hotkey="g p" data-selected-links="/pulls /pulls/assigned /pulls/mentioned /pulls">
            Pull requests
</a>        </li>
        <li class="header-nav-item">
          <a href="/issues" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:issues context:user" data-hotkey="g i" data-selected-links="/issues /issues/assigned /issues/mentioned /issues">
            Issues
</a>        </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com/" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
      </ul>

    
<ul class="header-nav user-nav right" id="user-links">
  <li class="header-nav-item">
      <span class="js-socket-channel js-updatable-content"
        data-channel="notification-changed:crashh"
        data-url="/notifications/header">
      <a href="/notifications" aria-label="You have unread notifications" class="header-nav-link notification-indicator tooltipped tooltipped-s" data-ga-click="Header, go to notifications, icon:unread" data-hotkey="g n">
          <span class="mail-status unread"></span>
          <span class="octicon octicon-bell "></span>
</a>  </span>

  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link tooltipped tooltipped-s js-menu-target" href="/new"
       aria-label="Create new…"
       data-ga-click="Header, create new, icon:add">
      <span class="octicon octicon-plus left"></span>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <ul class="dropdown-menu dropdown-menu-sw">
        
<a class="dropdown-item" href="/new" data-ga-click="Header, create new repository">
  New repository
</a>


  <a class="dropdown-item" href="/organizations/new" data-ga-click="Header, create new organization">
    New organization
  </a>



  <div class="dropdown-divider"></div>
  <div class="dropdown-header">
    <span title="crashh/DM847-Introduction-to-Bioinformatics">This repository</span>
  </div>
    <a class="dropdown-item" href="/crashh/DM847-Introduction-to-Bioinformatics/issues/new" data-ga-click="Header, create new issue">
      New issue
    </a>
    <a class="dropdown-item" href="/crashh/DM847-Introduction-to-Bioinformatics/settings/collaboration" data-ga-click="Header, create new collaborator">
      New collaborator
    </a>

      </ul>
    </div>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name tooltipped tooltipped-sw js-menu-target" href="/crashh"
       aria-label="View profile and more"
       data-ga-click="Header, show menu, icon:avatar">
      <img alt="@crashh" class="avatar" height="20" src="https://avatars2.githubusercontent.com/u/6775794?v=3&amp;s=40" width="20" />
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <div class="dropdown-menu  dropdown-menu-sw">
        <div class=" dropdown-header header-nav-current-user css-truncate">
            Signed in as <strong class="css-truncate-target">crashh</strong>

        </div>


        <div class="dropdown-divider"></div>

          <a class="dropdown-item" href="/crashh" data-ga-click="Header, go to profile, text:your profile">
            Your profile
          </a>
        <a class="dropdown-item" href="/stars" data-ga-click="Header, go to starred repos, text:your stars">
          Your stars
        </a>
        <a class="dropdown-item" href="/explore" data-ga-click="Header, go to explore, text:explore">
          Explore
        </a>
          <a class="dropdown-item" href="/integrations" data-ga-click="Header, go to integrations, text:integrations">
            Integrations
          </a>
        <a class="dropdown-item" href="https://help.github.com" data-ga-click="Header, go to help, text:help">
          Help
        </a>

          <div class="dropdown-divider"></div>

          <a class="dropdown-item" href="/settings/profile" data-ga-click="Header, go to settings, icon:settings">
            Settings
          </a>

          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/logout" class="logout-form" data-form-nonce="91347a826128a798d94be0d8a44dcb66c377cc9f" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="xi/+qh5MbMySBbvD7vMq7WIgrV8y7LfZqdpZA3oxbxIcS2mc7j5e3gu8eL/AkSqvStITU9TLiQZHPKuVLQWqgQ==" /></div>
            <button class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout">
              Sign out
            </button>
</form>
      </div>
    </div>
  </li>
</ul>


    
  </div>
</div>

      

      


    <div id="start-of-content" class="accessibility-aid"></div>

      <div id="js-flash-container">
</div>


    <div role="main" class="main-content">
        <div itemscope itemtype="http://schema.org/WebPage">
    <div id="js-repo-pjax-container" class="context-loader-container js-repo-nav-next" data-pjax-container>
      
<div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav">
  <div class="container repohead-details-container">

    

<ul class="pagehead-actions">

  <li>
        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-form-nonce="91347a826128a798d94be0d8a44dcb66c377cc9f" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="2c39vxwldgVLqyMJYTwTWRLckuV9+dD2kMCyUB9bf8LmYU0aMizRVpvvtlrWNz/GxDmZiVkuJl72OMY428FphQ==" /></div>      <input id="repository_id" name="repository_id" type="hidden" value="42037188" />

        <div class="select-menu js-menu-container js-select-menu">
          <a href="/crashh/DM847-Introduction-to-Bioinformatics/subscription"
            class="btn btn-sm btn-with-count select-menu-button js-menu-target" role="button" tabindex="0" aria-haspopup="true"
            data-ga-click="Repository, click Watch settings, action:blob#show">
            <span class="js-select-button">
              <span class="octicon octicon-eye "></span>
              Unwatch
            </span>
          </a>
          <a class="social-count js-social-count" href="/crashh/DM847-Introduction-to-Bioinformatics/watchers">
            6
          </a>

        <div class="select-menu-modal-holder">
          <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
            <div class="select-menu-header">
              <span aria-label="Close" class="octicon octicon-x js-menu-close" role="button"></span>
              <span class="select-menu-title">Notifications</span>
            </div>

              <div class="select-menu-list js-navigation-container" role="menu">

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <div class="select-menu-item-text">
                    <input id="do_included" name="do" type="radio" value="included" />
                    <span class="select-menu-item-heading">Not watching</span>
                    <span class="description">Be notified when participating or @mentioned.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <span class="octicon octicon-eye"></span>
                      Watch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
                  <span class="select-menu-item-icon octicon octicon octicon-check"></span>
                  <div class="select-menu-item-text">
                    <input checked="checked" id="do_subscribed" name="do" type="radio" value="subscribed" />
                    <span class="select-menu-item-heading">Watching</span>
                    <span class="description">Be notified of all conversations.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <span class="octicon octicon-eye"></span>
                      Unwatch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <div class="select-menu-item-text">
                    <input id="do_ignore" name="do" type="radio" value="ignore" />
                    <span class="select-menu-item-heading">Ignoring</span>
                    <span class="description">Never be notified.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <span class="octicon octicon-mute"></span>
                      Stop ignoring
                    </span>
                  </div>
                </div>

              </div>

            </div>
          </div>
        </div>
</form>
  </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">

    <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/crashh/DM847-Introduction-to-Bioinformatics/unstar" class="js-toggler-form starred js-unstar-button" data-form-nonce="91347a826128a798d94be0d8a44dcb66c377cc9f" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="kPigc/E2Vk0smPIuLa2NpnibzTyi5q2Ahf1+5+XBxeMj7w6xV/HyBiPniPzkK0lL7Y/+eXDYcThKM0eU1pqhFQ==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Unstar this repository" title="Unstar crashh/DM847-Introduction-to-Bioinformatics"
        data-ga-click="Repository, click unstar button, action:blob#show; text:Unstar">
        <span class="octicon octicon-star "></span>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/crashh/DM847-Introduction-to-Bioinformatics/stargazers">
          0
        </a>
</form>
    <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/crashh/DM847-Introduction-to-Bioinformatics/star" class="js-toggler-form unstarred js-star-button" data-form-nonce="91347a826128a798d94be0d8a44dcb66c377cc9f" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="IA31kOBrYhEKwS2hUSbsXdvV1WYiWM+KOKcTI/6QucsFegXKHi7MzXPGRuy8GFXv6lx6mcNQXJNVGuoQVLdVUA==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Star this repository" title="Star crashh/DM847-Introduction-to-Bioinformatics"
        data-ga-click="Repository, click star button, action:blob#show; text:Star">
        <span class="octicon octicon-star "></span>
        Star
      </button>
        <a class="social-count js-social-count" href="/crashh/DM847-Introduction-to-Bioinformatics/stargazers">
          0
        </a>
</form>  </div>

  </li>

  <li>
          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/crashh/DM847-Introduction-to-Bioinformatics/fork" class="btn-with-count" data-form-nonce="91347a826128a798d94be0d8a44dcb66c377cc9f" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="mVxo/eZpn9I2rdLQuxdkMCP197trfth7AItbHsr3aq/VujyB5FjL7LAMfDHnzkUGQYR95YAan3ZqwBdyGW+0yg==" /></div>
            <button
                type="submit"
                class="btn btn-sm btn-with-count"
                data-ga-click="Repository, show fork modal, action:blob#show; text:Fork"
                title="Fork your own copy of crashh/DM847-Introduction-to-Bioinformatics to your account"
                aria-label="Fork your own copy of crashh/DM847-Introduction-to-Bioinformatics to your account">
              <span class="octicon octicon-repo-forked "></span>
              Fork
            </button>
</form>
    <a href="/crashh/DM847-Introduction-to-Bioinformatics/network" class="social-count">
      0
    </a>
  </li>
</ul>

    <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title private ">
  <span class="octicon octicon-lock "></span>
  <span class="author"><a href="/crashh" class="url fn" itemprop="url" rel="author"><span itemprop="title">crashh</span></a></span><!--
--><span class="path-divider">/</span><!--
--><strong><a href="/crashh/DM847-Introduction-to-Bioinformatics" data-pjax="#js-repo-pjax-container">DM847-Introduction-to-Bioinformatics</a></strong>
    <span class="repo-private-label">private</span>

  <span class="page-context-loader">
    <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
  </span>

</h1>

  </div>
  <div class="container">
    
<nav class="reponav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container">

  <a href="/crashh/DM847-Introduction-to-Bioinformatics" aria-label="Code" aria-selected="true" class="js-selected-navigation-item selected reponav-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /crashh/DM847-Introduction-to-Bioinformatics">
    <span class="octicon octicon-code "></span>
    Code
</a>
    <a href="/crashh/DM847-Introduction-to-Bioinformatics/issues" class="js-selected-navigation-item reponav-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /crashh/DM847-Introduction-to-Bioinformatics/issues">
      <span class="octicon octicon-issue-opened "></span>
      Issues
      <span class="counter">0</span>
</a>
  <a href="/crashh/DM847-Introduction-to-Bioinformatics/pulls" class="js-selected-navigation-item reponav-item" data-hotkey="g p" data-selected-links="repo_pulls /crashh/DM847-Introduction-to-Bioinformatics/pulls">
    <span class="octicon octicon-git-pull-request "></span>
    Pull requests
    <span class="counter">0</span>
</a>
    <a href="/crashh/DM847-Introduction-to-Bioinformatics/wiki" class="js-selected-navigation-item reponav-item" data-hotkey="g w" data-selected-links="repo_wiki /crashh/DM847-Introduction-to-Bioinformatics/wiki">
      <span class="octicon octicon-book "></span>
      Wiki
</a>
  <a href="/crashh/DM847-Introduction-to-Bioinformatics/pulse" class="js-selected-navigation-item reponav-item" data-selected-links="pulse /crashh/DM847-Introduction-to-Bioinformatics/pulse">
    <span class="octicon octicon-pulse "></span>
    Pulse
</a>
  <a href="/crashh/DM847-Introduction-to-Bioinformatics/graphs" class="js-selected-navigation-item reponav-item" data-selected-links="repo_graphs repo_contributors /crashh/DM847-Introduction-to-Bioinformatics/graphs">
    <span class="octicon octicon-graph "></span>
    Graphs
</a>
    <a href="/crashh/DM847-Introduction-to-Bioinformatics/settings" class="js-selected-navigation-item reponav-item" data-selected-links="repo_settings repo_branch_settings hooks /crashh/DM847-Introduction-to-Bioinformatics/settings">
      <span class="octicon octicon-gear "></span>
      Settings
</a>
</nav>

  </div>
</div>

<div class="container new-discussion-timeline experiment-repo-nav">
  <div class="repository-content">

    

<a href="/crashh/DM847-Introduction-to-Bioinformatics/blob/feefe321957f9f6211ac9be77ce0c7172be5c6e6/projekt/other/src/random_forest_fold.R" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:49113fea18900e63498b4c13034794dd -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu js-menu-container js-select-menu left">
  <button class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    title="master"
    type="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <i>Branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span aria-label="Close" class="octicon octicon-x js-menu-close" role="button"></span>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Find or create a branch…" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/crashh/DM847-Introduction-to-Bioinformatics/blob/master/projekt/other/src/random_forest_fold.R"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="master">
                master
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/crashh/DM847-Introduction-to-Bioinformatics/blob/only-project/projekt/other/src/random_forest_fold.R"
               data-name="only-project"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="only-project">
                only-project
              </span>
            </a>
        </div>

          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/crashh/DM847-Introduction-to-Bioinformatics/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" data-form-nonce="91347a826128a798d94be0d8a44dcb66c377cc9f" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="3GfpcQjbhvAiRq1BiH4lAu8hN+xk+e+n5dCkS/wP9chypZKXuW9e7IXBdDYQ5Eyb4TUiymZzdOgBjMUl0dkH/Q==" /></div>
            <span class="octicon octicon-git-branch select-menu-item-icon"></span>
            <div class="select-menu-item-text">
              <span class="select-menu-item-heading">Create branch: <span class="js-new-item-name"></span></span>
              <span class="description">from ‘master’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="master">
            <input type="hidden" name="path" id="path" value="projekt/other/src/random_forest_fold.R">
</form>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="btn-group right">
    <a href="/crashh/DM847-Introduction-to-Bioinformatics/find/master"
          class="js-show-file-finder btn btn-sm"
          data-pjax
          data-hotkey="t">
      Find file
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button">Copy path</button>
  </div>
  <div class="breadcrumb js-zeroclipboard-target">
    <span class="repo-root js-repo-root"><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/crashh/DM847-Introduction-to-Bioinformatics" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">DM847-Introduction-to-Bioinformatics</span></a></span></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/crashh/DM847-Introduction-to-Bioinformatics/tree/master/projekt" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">projekt</span></a></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/crashh/DM847-Introduction-to-Bioinformatics/tree/master/projekt/other" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">other</span></a></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/crashh/DM847-Introduction-to-Bioinformatics/tree/master/projekt/other/src" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">src</span></a></span><span class="separator">/</span><strong class="final-path">random_forest_fold.R</strong>
  </div>
</div>


  <div class="commit-tease">
      <span class="right">
        <a class="commit-tease-sha" href="/crashh/DM847-Introduction-to-Bioinformatics/commit/cb3cbb2ccd21719726e31b9a63eb8a8bb0e6ad6f" data-pjax>
          cb3cbb2
        </a>
        <time datetime="2015-12-07T19:03:41Z" is="relative-time">Dec 7, 2015</time>
      </span>
      <div>
        <img alt="@Ezbob" class="avatar" height="20" src="https://avatars2.githubusercontent.com/u/9615239?v=3&amp;s=40" width="20" />
        <a href="/Ezbob" class="user-mention" rel="contributor">Ezbob</a>
          <a href="/crashh/DM847-Introduction-to-Bioinformatics/commit/cb3cbb2ccd21719726e31b9a63eb8a8bb0e6ad6f" class="message" data-pjax="true" title="Rearranged the projekt folder; added some starting java code for our project.">Rearranged the projekt folder; added some starting java code for our …</a>
      </div>

    <div class="commit-tease-contributors">
      <a class="muted-link contributors-toggle" href="#blob_contributors_box" rel="facebox">
        <strong>1</strong>
         contributor
      </a>
      
    </div>

    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header" data-facebox-id="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list" data-facebox-id="facebox-description">
          <li class="facebox-user-list-item">
            <img alt="@Ezbob" height="24" src="https://avatars0.githubusercontent.com/u/9615239?v=3&amp;s=48" width="24" />
            <a href="/Ezbob">Ezbob</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="btn-group">
      <a href="/crashh/DM847-Introduction-to-Bioinformatics/raw/master/projekt/other/src/random_forest_fold.R" class="btn btn-sm " id="raw-url">Raw</a>
        <a href="/crashh/DM847-Introduction-to-Bioinformatics/blame/master/projekt/other/src/random_forest_fold.R" class="btn btn-sm js-update-url-with-hash">Blame</a>
      <a href="/crashh/DM847-Introduction-to-Bioinformatics/commits/master/projekt/other/src/random_forest_fold.R" class="btn btn-sm " rel="nofollow">History</a>
    </div>


        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/crashh/DM847-Introduction-to-Bioinformatics/edit/master/projekt/other/src/random_forest_fold.R" class="inline-form js-update-url-with-hash" data-form-nonce="91347a826128a798d94be0d8a44dcb66c377cc9f" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="CWIvha492gZ5VsFsNQ6iPfi12qtacM1FTY4BbWzs4XmqqMy1AGpi1Cjfe2Brbx3H1SVLVBve72rrFEAF1v2MQg==" /></div>
          <button class="octicon-btn tooltipped tooltipped-nw" type="submit"
            aria-label="Edit this file" data-hotkey="e" data-disable-with>
            <span class="octicon octicon-pencil "></span>
          </button>
</form>        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/crashh/DM847-Introduction-to-Bioinformatics/delete/master/projekt/other/src/random_forest_fold.R" class="inline-form" data-form-nonce="91347a826128a798d94be0d8a44dcb66c377cc9f" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="ZS1iixJ168XKcM8HXTgTNJB0hXlDpWhhDpWRPn7iA5DT1gVsFjhxEgudFTSIMBXMuqWA28EwaCI7OlAlBZp/3Q==" /></div>
          <button class="octicon-btn octicon-btn-danger tooltipped tooltipped-nw" type="submit"
            aria-label="Delete this file" data-disable-with>
            <span class="octicon octicon-trashcan "></span>
          </button>
</form>  </div>

  <div class="file-info">
      <span class="file-mode" title="File mode">executable file</span>
      <span class="file-info-divider"></span>
      107 lines (93 sloc)
      <span class="file-info-divider"></span>
    3.53 KB
  </div>
</div>

  

  <div class="blob-wrapper data type-r">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#!/usr/local/bin/Rscript</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">args</span> <span class="pl-k">&lt;-</span> commandArgs(<span class="pl-c1">TRUE</span>)</td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Check if required packages are installed, if not try to install them</span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line"><span class="pl-k">if</span>(require(<span class="pl-s"><span class="pl-pds">&quot;</span>randomForest<span class="pl-pds">&quot;</span></span>)){</td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line">    print(<span class="pl-s"><span class="pl-pds">&quot;</span>randomForest is loaded correctly<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line">} <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line">    print(<span class="pl-s"><span class="pl-pds">&quot;</span>trying to install randomForest<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line">    install.packages(<span class="pl-s"><span class="pl-pds">&quot;</span>randomForest<span class="pl-pds">&quot;</span></span>, <span class="pl-v">repos</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">&quot;</span>http://cran.rstudio.com/<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span>(require(<span class="pl-s"><span class="pl-pds">&quot;</span>randomForest<span class="pl-pds">&quot;</span></span>)){</td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line">        print(<span class="pl-s"><span class="pl-pds">&quot;</span>randomForest installed and loaded<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line">    } <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line">        stop(<span class="pl-s"><span class="pl-pds">&quot;</span>could not install randomForest<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line">    }</td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line"><span class="pl-k">if</span>(require(<span class="pl-s"><span class="pl-pds">&quot;</span>cvTools<span class="pl-pds">&quot;</span></span>)){</td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line">    print(<span class="pl-s"><span class="pl-pds">&quot;</span>cvTools is loaded correctly<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line">} <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line">    print(<span class="pl-s"><span class="pl-pds">&quot;</span>trying to install cvTools<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line">    install.packages(<span class="pl-s"><span class="pl-pds">&quot;</span>cvTools<span class="pl-pds">&quot;</span></span>, <span class="pl-v">repos</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">&quot;</span>http://cran.rstudio.com/<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span>(require(<span class="pl-s"><span class="pl-pds">&quot;</span>cvTools<span class="pl-pds">&quot;</span></span>)){</td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line">        print(<span class="pl-s"><span class="pl-pds">&quot;</span>cvTools installed and loaded<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line">    } <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line">        stop(<span class="pl-s"><span class="pl-pds">&quot;</span>could not install cvTools<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line">    }</td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line"><span class="pl-v">K</span> <span class="pl-k">=</span> as.numeric(<span class="pl-smi">args</span>[<span class="pl-c1">1</span>])</td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">dir</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">args</span>[<span class="pl-c1">2</span>]</td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">file_labelled</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">args</span>[<span class="pl-c1">3</span>]</td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">file_unlabelled</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">args</span>[<span class="pl-c1">4</span>]</td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">file_unlabelled_predictions</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">args</span>[<span class="pl-c1">5</span>]</td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#TODO: Add support for both labelled file in and unlabelled file in, also output path file</span></td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line">setwd(<span class="pl-smi">dir</span>)</td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">breath</span> <span class="pl-k">&lt;-</span> read.csv(<span class="pl-smi">file_labelled</span>, <span class="pl-v">header</span> <span class="pl-k">=</span> <span class="pl-c1">TRUE</span>, <span class="pl-v">sep</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\t</span><span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">breath</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">breath</span>[,<span class="pl-k">-</span><span class="pl-c1">1</span>]</td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code blob-code-inner js-file-line">set.seed(<span class="pl-c1">12345</span>)</td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">folds</span> <span class="pl-k">&lt;-</span> cvFolds(nrow(<span class="pl-smi">breath</span>), <span class="pl-v">K</span> <span class="pl-k">=</span> <span class="pl-smi">K</span>)</td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">test</span> <span class="pl-k">&lt;-</span> <span class="pl-k">list</span>()</td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#for each</span></td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code blob-code-inner js-file-line"><span class="pl-k">for</span> (<span class="pl-smi">i</span> <span class="pl-k">in</span> <span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-smi">K</span>){</td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">test_index</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">folds</span><span class="pl-k">$</span><span class="pl-smi">subset</span>[ seq(<span class="pl-smi">i</span>, length(<span class="pl-smi">folds</span><span class="pl-k">$</span><span class="pl-smi">subset</span>), <span class="pl-smi">K</span>),]</td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">data_index</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">folds</span><span class="pl-k">$</span><span class="pl-smi">subset</span>[<span class="pl-k">-</span>seq(<span class="pl-smi">i</span>, length(<span class="pl-smi">folds</span><span class="pl-k">$</span><span class="pl-smi">subset</span>), <span class="pl-smi">K</span>),]</td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">breath.rf</span> <span class="pl-k">&lt;-</span> randomForest(<span class="pl-smi">class</span> <span class="pl-k">~</span> ., <span class="pl-v">data</span><span class="pl-k">=</span><span class="pl-smi">breath</span>, <span class="pl-v">subset</span><span class="pl-k">=</span><span class="pl-smi">data_index</span>, <span class="pl-v">importance</span><span class="pl-k">=</span><span class="pl-c1">TRUE</span>, <span class="pl-v">proximity</span><span class="pl-k">=</span><span class="pl-c1">TRUE</span>, <span class="pl-v">keep.forest</span><span class="pl-k">=</span><span class="pl-c1">TRUE</span>, </td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code blob-code-inner js-file-line">                          <span class="pl-v">xtest</span><span class="pl-k">=</span><span class="pl-smi">breath</span>[<span class="pl-smi">test_index</span>, names(<span class="pl-smi">breath</span>)<span class="pl-k">!=</span><span class="pl-s"><span class="pl-pds">&#39;</span>class<span class="pl-pds">&#39;</span></span>], <span class="pl-v">ytest</span><span class="pl-k">=</span><span class="pl-smi">breath</span>[<span class="pl-smi">test_index</span>,<span class="pl-s"><span class="pl-pds">&#39;</span>class<span class="pl-pds">&#39;</span></span>])</td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]] <span class="pl-k">&lt;-</span> <span class="pl-smi">breath.rf</span></td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">sensi</span> <span class="pl-k">&lt;-</span> <span class="pl-c1">0</span></td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">spec</span>  <span class="pl-k">&lt;-</span> <span class="pl-c1">0</span></td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">acur</span>  <span class="pl-k">&lt;-</span> <span class="pl-c1">0</span></td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code blob-code-inner js-file-line"><span class="pl-k">for</span> (<span class="pl-smi">i</span> <span class="pl-k">in</span> <span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-smi">K</span>){</td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">acur</span>  <span class="pl-k">&lt;-</span> <span class="pl-smi">acur</span>  <span class="pl-k">+</span> (<span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">1</span>, <span class="pl-c1">1</span>] <span class="pl-k">+</span> <span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">1</span>, <span class="pl-c1">1</span>])<span class="pl-k">/</span></td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code blob-code-inner js-file-line">                    (<span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">1</span>, <span class="pl-c1">1</span>] <span class="pl-k">+</span> <span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">1</span>, <span class="pl-c1">2</span>] <span class="pl-k">+</span> <span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">2</span>, <span class="pl-c1">2</span>]<span class="pl-k">+</span><span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">2</span>, <span class="pl-c1">1</span>])</td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span>(<span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">1</span>, <span class="pl-c1">1</span>]<span class="pl-k">+</span><span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">2</span>, <span class="pl-c1">1</span>] <span class="pl-k">==</span> <span class="pl-c1">0</span>){</td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code blob-code-inner js-file-line">    <span class="pl-smi">sensi</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">sensi</span> <span class="pl-k">+</span><span class="pl-c1">1</span></td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code blob-code-inner js-file-line">  }<span class="pl-k">else</span>{</td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code blob-code-inner js-file-line">    <span class="pl-smi">sensi</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">sensi</span> <span class="pl-k">+</span> <span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">1</span>, <span class="pl-c1">1</span>]<span class="pl-k">/</span>(<span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">1</span>, <span class="pl-c1">1</span>]<span class="pl-k">+</span><span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">2</span>, <span class="pl-c1">1</span>])</td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span>(<span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">2</span>, <span class="pl-c1">2</span>]<span class="pl-k">+</span><span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">1</span>, <span class="pl-c1">2</span>] <span class="pl-k">==</span> <span class="pl-c1">0</span>){</td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code blob-code-inner js-file-line">    <span class="pl-smi">spec</span>  <span class="pl-k">&lt;-</span> <span class="pl-smi">spec</span>  <span class="pl-k">+</span> <span class="pl-c1">1</span></td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code blob-code-inner js-file-line">  }<span class="pl-k">else</span>{</td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code blob-code-inner js-file-line">    <span class="pl-smi">spec</span>  <span class="pl-k">&lt;-</span> <span class="pl-smi">spec</span>  <span class="pl-k">+</span> <span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">2</span>, <span class="pl-c1">2</span>]<span class="pl-k">/</span>(<span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">2</span>, <span class="pl-c1">2</span>]<span class="pl-k">+</span><span class="pl-smi">test</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">test</span><span class="pl-k">$</span><span class="pl-smi">confusion</span>[<span class="pl-c1">1</span>, <span class="pl-c1">2</span>])</td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">acur</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">acur</span><span class="pl-k">/</span><span class="pl-smi">K</span></td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">sensi</span> <span class="pl-k">&lt;-</span><span class="pl-smi">sensi</span><span class="pl-k">/</span><span class="pl-smi">K</span></td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">spec</span> <span class="pl-k">&lt;-</span><span class="pl-smi">spec</span><span class="pl-k">/</span><span class="pl-smi">K</span></td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">mostdescri</span> <span class="pl-k">&lt;-</span> head(sort(<span class="pl-smi">breath.rf</span><span class="pl-k">$</span><span class="pl-smi">importance</span>[,<span class="pl-c1">4</span>], <span class="pl-v">decreasing</span><span class="pl-k">=</span><span class="pl-c1">T</span>), <span class="pl-v">n</span><span class="pl-k">=</span><span class="pl-c1">5</span>)</td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">datadescri</span> <span class="pl-k">&lt;-</span> as.vector(names(<span class="pl-smi">mostdescri</span>))</td>
      </tr>
      <tr>
        <td id="L79" class="blob-num js-line-number" data-line-number="79"></td>
        <td id="LC79" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">datadescri</span> <span class="pl-k">&lt;-</span> c(<span class="pl-smi">datadescri</span>, <span class="pl-s"><span class="pl-pds">&#39;</span>class<span class="pl-pds">&#39;</span></span>)</td>
      </tr>
      <tr>
        <td id="L80" class="blob-num js-line-number" data-line-number="80"></td>
        <td id="LC80" class="blob-code blob-code-inner js-file-line"><span class="pl-v">newlist</span> <span class="pl-k">=</span> <span class="pl-smi">breath</span>[,<span class="pl-smi">datadescri</span>]</td>
      </tr>
      <tr>
        <td id="L81" class="blob-num js-line-number" data-line-number="81"></td>
        <td id="LC81" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L82" class="blob-num js-line-number" data-line-number="82"></td>
        <td id="LC82" class="blob-code blob-code-inner js-file-line"><span class="pl-k">for</span> (<span class="pl-smi">i</span> <span class="pl-k">in</span> <span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-smi">K</span>){</td>
      </tr>
      <tr>
        <td id="L83" class="blob-num js-line-number" data-line-number="83"></td>
        <td id="LC83" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">test_index</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">folds</span><span class="pl-k">$</span><span class="pl-smi">subset</span>[ seq(<span class="pl-smi">i</span>, length(<span class="pl-smi">folds</span><span class="pl-k">$</span><span class="pl-smi">subset</span>), <span class="pl-smi">K</span>),]</td>
      </tr>
      <tr>
        <td id="L84" class="blob-num js-line-number" data-line-number="84"></td>
        <td id="LC84" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">data_index</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">folds</span><span class="pl-k">$</span><span class="pl-smi">subset</span>[<span class="pl-k">-</span>seq(<span class="pl-smi">i</span>, length(<span class="pl-smi">folds</span><span class="pl-k">$</span><span class="pl-smi">subset</span>), <span class="pl-smi">K</span>),]</td>
      </tr>
      <tr>
        <td id="L85" class="blob-num js-line-number" data-line-number="85"></td>
        <td id="LC85" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">datadescri.rf</span> <span class="pl-k">&lt;-</span> randomForest(<span class="pl-smi">class</span> <span class="pl-k">~</span> ., <span class="pl-v">data</span><span class="pl-k">=</span><span class="pl-smi">newlist</span>, <span class="pl-v">subset</span><span class="pl-k">=</span><span class="pl-smi">data_index</span>, <span class="pl-v">importance</span><span class="pl-k">=</span><span class="pl-c1">TRUE</span>, <span class="pl-v">proximity</span><span class="pl-k">=</span><span class="pl-c1">TRUE</span>, <span class="pl-v">keep.forest</span><span class="pl-k">=</span><span class="pl-c1">TRUE</span>, </td>
      </tr>
      <tr>
        <td id="L86" class="blob-num js-line-number" data-line-number="86"></td>
        <td id="LC86" class="blob-code blob-code-inner js-file-line">             <span class="pl-v">xtest</span><span class="pl-k">=</span><span class="pl-smi">newlist</span>[<span class="pl-smi">test_index</span>, names(<span class="pl-smi">newlist</span>)<span class="pl-k">!=</span><span class="pl-s"><span class="pl-pds">&#39;</span>class<span class="pl-pds">&#39;</span></span>], <span class="pl-v">ytest</span><span class="pl-k">=</span><span class="pl-smi">newlist</span>[<span class="pl-smi">test_index</span>,<span class="pl-s"><span class="pl-pds">&#39;</span>class<span class="pl-pds">&#39;</span></span>])</td>
      </tr>
      <tr>
        <td id="L87" class="blob-num js-line-number" data-line-number="87"></td>
        <td id="LC87" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L88" class="blob-num js-line-number" data-line-number="88"></td>
        <td id="LC88" class="blob-code blob-code-inner js-file-line">print(<span class="pl-s"><span class="pl-pds">&quot;</span>Mean Acuracy<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L89" class="blob-num js-line-number" data-line-number="89"></td>
        <td id="LC89" class="blob-code blob-code-inner js-file-line">print(<span class="pl-smi">acur</span>)</td>
      </tr>
      <tr>
        <td id="L90" class="blob-num js-line-number" data-line-number="90"></td>
        <td id="LC90" class="blob-code blob-code-inner js-file-line">print(<span class="pl-s"><span class="pl-pds">&quot;</span>Sensitivity<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L91" class="blob-num js-line-number" data-line-number="91"></td>
        <td id="LC91" class="blob-code blob-code-inner js-file-line">print(<span class="pl-smi">sensi</span>)</td>
      </tr>
      <tr>
        <td id="L92" class="blob-num js-line-number" data-line-number="92"></td>
        <td id="LC92" class="blob-code blob-code-inner js-file-line">print(<span class="pl-s"><span class="pl-pds">&quot;</span>Specificity<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L93" class="blob-num js-line-number" data-line-number="93"></td>
        <td id="LC93" class="blob-code blob-code-inner js-file-line">print(<span class="pl-smi">spec</span>)</td>
      </tr>
      <tr>
        <td id="L94" class="blob-num js-line-number" data-line-number="94"></td>
        <td id="LC94" class="blob-code blob-code-inner js-file-line">print(<span class="pl-s"><span class="pl-pds">&quot;</span>5 most discriminating features using Gini index<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L95" class="blob-num js-line-number" data-line-number="95"></td>
        <td id="LC95" class="blob-code blob-code-inner js-file-line">print(<span class="pl-smi">mostdescri</span>)</td>
      </tr>
      <tr>
        <td id="L96" class="blob-num js-line-number" data-line-number="96"></td>
        <td id="LC96" class="blob-code blob-code-inner js-file-line">print(<span class="pl-s"><span class="pl-pds">&quot;</span>Decision tree<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L97" class="blob-num js-line-number" data-line-number="97"></td>
        <td id="LC97" class="blob-code blob-code-inner js-file-line">print(getTree(<span class="pl-smi">datadescri.rf</span>, <span class="pl-v">k</span><span class="pl-k">=</span><span class="pl-c1">42</span>, <span class="pl-v">labelVar</span> <span class="pl-k">=</span> <span class="pl-c1">T</span>))</td>
      </tr>
      <tr>
        <td id="L98" class="blob-num js-line-number" data-line-number="98"></td>
        <td id="LC98" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L99" class="blob-num js-line-number" data-line-number="99"></td>
        <td id="LC99" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">unlabelled</span> <span class="pl-k">&lt;-</span> read.csv(<span class="pl-smi">file_unlabelled</span>, <span class="pl-v">header</span> <span class="pl-k">=</span> <span class="pl-c1">TRUE</span>, <span class="pl-v">sep</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\t</span><span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L100" class="blob-num js-line-number" data-line-number="100"></td>
        <td id="LC100" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">unlabelled_files</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">unlabelled</span>[,<span class="pl-c1">1</span>]</td>
      </tr>
      <tr>
        <td id="L101" class="blob-num js-line-number" data-line-number="101"></td>
        <td id="LC101" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">unlabelled</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">unlabelled</span>[,<span class="pl-k">-</span><span class="pl-c1">1</span>]</td>
      </tr>
      <tr>
        <td id="L102" class="blob-num js-line-number" data-line-number="102"></td>
        <td id="LC102" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">p</span> <span class="pl-k">&lt;-</span> predict(<span class="pl-smi">datadescri.rf</span>, <span class="pl-v">newdata</span> <span class="pl-k">=</span> <span class="pl-smi">unlabelled</span>, <span class="pl-v">type</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">&quot;</span>class<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L103" class="blob-num js-line-number" data-line-number="103"></td>
        <td id="LC103" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">predictions</span> <span class="pl-k">&lt;-</span> c(<span class="pl-s"><span class="pl-pds">&#39;</span>file<span class="pl-pds">&#39;</span></span>, as.character(<span class="pl-smi">unlabelled_files</span>))</td>
      </tr>
      <tr>
        <td id="L104" class="blob-num js-line-number" data-line-number="104"></td>
        <td id="LC104" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">predictions</span> <span class="pl-k">&lt;-</span> cbind(<span class="pl-smi">predictions</span>, c(<span class="pl-s"><span class="pl-pds">&#39;</span>candy<span class="pl-pds">&#39;</span></span>, as.character(<span class="pl-smi">p</span>)))</td>
      </tr>
      <tr>
        <td id="L105" class="blob-num js-line-number" data-line-number="105"></td>
        <td id="LC105" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">predictions</span></td>
      </tr>
      <tr>
        <td id="L106" class="blob-num js-line-number" data-line-number="106"></td>
        <td id="LC106" class="blob-code blob-code-inner js-file-line">write.table(<span class="pl-smi">predictions</span>, <span class="pl-v">row.names</span><span class="pl-k">=</span><span class="pl-c1">F</span>, <span class="pl-v">col.names</span><span class="pl-k">=</span><span class="pl-c1">F</span>, <span class="pl-v">quote</span><span class="pl-k">=</span><span class="pl-c1">F</span>, <span class="pl-v">sep</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&#39;</span><span class="pl-cce">\t</span><span class="pl-pds">&#39;</span></span>, <span class="pl-v">file</span><span class="pl-k">=</span><span class="pl-smi">file_unlabelled_predictions</span>)</td>
      </tr>
</table>

  </div>

</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

  </div>
  <div class="modal-backdrop"></div>
</div>

    </div>
  </div>

    </div>

        <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>
        <li><a href="https://github.com/pricing" data-ga-click="Footer, go to pricing, text:pricing">Pricing</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github " title="GitHub "></span>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.08898s from github-fe131-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



    
    
    

    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
        <span class="octicon octicon-x"></span>
      </button>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" integrity="sha256-7460qJ7p88i3YTMH/liaj1cFgX987ie+xRzl6WMjSr8=" src="https://assets-cdn.github.com/assets/frameworks-ef8eb4a89ee9f3c8b7613307fe589a8f5705817f7cee27bec51ce5e963234abf.js"></script>
      <script async="async" crossorigin="anonymous" integrity="sha256-S2uOfRHrt7zoUSbTtBMMgAQfKubV1u+JAajAw/fLgNI=" src="https://assets-cdn.github.com/assets/github-4b6b8e7d11ebb7bce85126d3b4130c80041f2ae6d5d6ef8901a8c0c3f7cb80d2.js"></script>
      
      
      
    <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner hidden">
      <span class="octicon octicon-alert"></span>
      <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
      <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
    </div>
  </body>
</html>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: Site Map</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=SiteMap" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="Follow-ups for JayBelanger" href="http://www.emacswiki.org/emacs?action=rss;followup=JayBelanger" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Follow-ups to JayBelanger"
      href="http://www.emacswiki.org/emacs?action=rss;followup=JayBelanger" />
<meta content="width=device-width" name="viewport" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  // https://stackoverflow.com/questions/280634/endswith-in-javascript
  if (typeof String.prototype.endsWith !== 'function') {
    String.prototype.endsWith = function(suffix) {
      return this.indexOf(suffix, this.length - suffix.length) !== -1;
    };
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;

	items = toc.getElementsByTagName('a');
	for (var i = 0; i < items.length; i++) {
	  while (items[i].textContent.endsWith('â')) {
            var text = items[i].childNodes[0].nodeValue;
	    items[i].childNodes[0].nodeValue = text.substring(0, text.length - 1);
	  }
	}
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://emacswiki.org/bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><div class="menu"><span class="gotobar bar"><a href="http://www.emacswiki.org/emacs/SiteMap" class="local">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a href="http://www.emacswiki.org/emacs/ElispArea" class="local">ElispArea</a> <a href="http://www.emacswiki.org/emacs/HowTo" class="local">HowTo</a> <a href="http://www.emacswiki.org/emacs/Glossary" class="local">Glossary</a> <a href="http://www.emacswiki.org/emacs/RecentChanges" class="local">RecentChanges</a> <a href="http://www.emacswiki.org/emacs/News" class="local">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a href="http://www.emacswiki.org/emacs/Suggestions" class="local">Suggestions</a> </span><div class="alert alert-danger" role="alert">We <a href="http://www.emacswiki.org/emacs/2015-01-03">moved to a new host</a> at the beginning of 2015. Please <a href="http://www.emacswiki.org/emacs/Comments_on_2015-01-03">report any issues</a> you find.</div></span><form method="get" action="http://www.emacswiki.org/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search"><p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form></div><h1><a rel="nofollow" title="Click to search for references to this page" href="http://www.emacswiki.org/emacs?search=%22SiteMap%22"><span style="padding-right: 0.5ex;">Site</span><span style="padding-right: 0.5ex;">Map</span></a></h1></div><div class="wrapper"><div class="content browse"><div class="include WikiLanguageMenu"><p><a href="http://www.emacswiki.org/emacs?interface=de" class="url http outside">Deutsch</a> | <a href="http://www.emacswiki.org/emacs?interface=en" class="url http outside">English</a> | <a class="url http outside" href="http://www.emacswiki.org/emacs?interface=es">Español</a> | <a href="http://www.emacswiki.org/emacs?interface=fr" class="url http outside">Français</a> | <a href="http://www.emacswiki.org/emacs?interface=pt" class="url http outside">Português</a> | <a href="http://www.emacswiki.org/emacs?interface=ru" class="url http outside">Русский</a> | <a href="http://www.emacswiki.org/emacs?interface=zh-cn" class="url http outside">简体中文</a> | <a class="url http outside" href="http://www.emacswiki.org/emacs?interface=zh-tw"> 繁體中文</a> | <a href="http://www.emacswiki.org/emacs?interface=se" class="url http outside">Svenska</a> | <a href="http://www.emacswiki.org/emacs?interface=ja" class="url http outside">日本語</a> | <a href="http://www.emacswiki.org/emacs?interface=ko" class="url http outside">한국어</a> | <a href="http://www.emacswiki.org/emacs?interface=it" class="url http outside">Italiano</a> </p></div><p>The <strong><a class="local" href="http://www.emacswiki.org/emacs/EmacsWiki">EmacsWiki</a></strong> is dedicated to documenting and discussing <a href="http://www.emacswiki.org/emacs/EmacsAndXEmacs" class="local">EmacsAndXEmacs</a> and <a href="http://www.emacswiki.org/emacs/EmacsLisp" class="local">EmacsLisp</a>. See the <a href="http://www.emacswiki.org/emacs/MissionStatement" class="local">MissionStatement</a> for more  information.</p><p>You can edit this website. There&#x2019;s a link, <strong>Edit this page</strong>, at the bottom of this and other pages. Please check <a href="http://www.emacswiki.org/emacs/SiteMap_Discussion" class="local">SiteMap Discussion</a> before editing this <a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> page, however.</p><ul><li><a class="local" href="http://www.emacswiki.org/emacs/HowToNavigate">HowToNavigate</a> &#x2013; help using the site</li><li><a href="http://www.emacswiki.org/emacs/ElispArea" class="local">ElispArea</a> &#x2013; upload and download <a href="http://www.emacswiki.org/emacs/EmacsLisp" class="local">EmacsLisp</a> source code</li><li><a href="http://www.emacswiki.org/emacs/HowToEdit" class="local">HowToEdit</a> &#x2013; how you can contribute to the site</li><li><a class="local" href="http://www.emacswiki.org/emacs/EmacsWikiAdministrators">EmacsWikiAdministrators</a> &#x2013; handling vandalism and spam on this site</li><li><a href="http://www.emacswiki.org/emacs/WikiDownload" class="local">WikiDownload</a> &#x2013; how to get copies of the site</li></ul><p><a class="anchor" name="LearningEmacs"></a> Learning About Emacs:</p><ul><li><a class="local" href="http://www.emacswiki.org/emacs/EmacsNewbie">EmacsNewbie</a> &#x2013; basic concepts, vocabulary, notation used in documentation</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryDocumentation">Documentation</a> &#x2013; Emacs is self-documenting and helpful</li><li><a href="http://www.emacswiki.org/emacs/CategoryHelp" class="local">Help</a> &#x2013; online help from Emacs itself and its users</li><li><a href="http://www.emacswiki.org/emacs/CategoryGlossary" class="local">Glossary</a> &#x2013; Emacs terminology</li><li><a class="local" href="http://www.emacswiki.org/emacs/EmacsNiftyTricks">EmacsNiftyTricks</a> &#x2013; tips you might not have found otherwise.</li><li><a class="local" href="http://www.emacswiki.org/emacs/RandomPage">RandomPage</a> &#x2013; for serendipitous visitors</li></ul><p><a class="anchor" name="DownloadAndInstallEmacs"></a> Downloading and Installing Emacs:</p><ul><li><a href="http://www.emacswiki.org/emacs/CategoryPorts" class="local">Ports</a> &#x2013; binaries for MS Windows, Mac, GNU/Linux and the free BSDs</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryWThirtyTwo">W32</a> &#x2013; obtaining and using Emacs for MS Windows</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryBuilding">Building</a> &#x2013; building Emacs from <em>source code</em>.</li></ul><p><a class="anchor" name="GeneralUse"></a> General Use:</p><ul><li><a href="http://www.emacswiki.org/emacs/CategoryAccessibility" class="local">Accessibility</a> &#x2013; how Emacs can make a computer more accessible; health issues</li><li><a href="http://www.emacswiki.org/emacs/CategoryBookmarking" class="local">Bookmarking</a> &#x2013; setting persistent locations and returning to them</li><li><a href="http://www.emacswiki.org/emacs/CategoryBufferSwitching" class="local">BufferSwitching</a> &#x2013; switching among different <a href="http://www.emacswiki.org/emacs/buffer" class="local">buffer</a>s</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryCommands">Commands</a> &#x2013; invoking and defining Emacs <a href="http://www.emacswiki.org/emacs/command" class="local">command</a>s, <code>&#x2018;M-x&#x2019;</code></li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryComparing">Comparing</a> &#x2013; Comparing, diffing and merging</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryCompletion">Completion</a> &#x2013; completing text in the <a href="http://www.emacswiki.org/emacs/minibuffer" class="local">minibuffer</a> or other <a href="http://www.emacswiki.org/emacs/buffer" class="local">buffer</a>s</li><li><a href="http://www.emacswiki.org/emacs/CategoryCustomize" class="local">Customize</a> &#x2013; customizing Emacs generally and with the &#x201c;easy customizing&#x201d; feature, <strong>Customize</strong><ul><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryDotEmacs">DotEmacs</a> &#x2013; <a href="http://www.emacswiki.org/emacs/EmacsLisp" class="local">EmacsLisp</a> code to put in your <a class="local" href="http://www.emacswiki.org/emacs/init_file">init file</a></li><li><a href="http://www.emacswiki.org/emacs/CategoryDisplay" class="local">Display</a> &#x2013; display/screen/terminal information (<a class="local" href="http://www.emacswiki.org/emacs/pointer">pointer</a> shapes, <a class="local" href="http://www.emacswiki.org/emacs/frame">frame</a>s&#x2026;)</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryFaces">Faces</a> &#x2013; text highlighting, colors, font-lock, syntax-driven highlighting</li><li><a href="http://www.emacswiki.org/emacs/CategoryFrames" class="local">Frames</a> &#x2013; <a class="local" href="http://www.emacswiki.org/emacs/frame">frame</a>s (window-manager windows).</li><li><a href="http://www.emacswiki.org/emacs/CategoryInternationalization" class="local">Internationalization</a> &#x2013; natural language support, character sets</li><li><a href="http://www.emacswiki.org/emacs/CategoryKeys" class="local">Keys</a> &#x2013; customizing <a class="local" href="http://www.emacswiki.org/emacs/key">key</a> bindings (&#x201c;keyboard shortcuts&#x201d;)<ul><li><a href="http://www.emacswiki.org/emacs/CategoryMouse" class="local">Mouse</a> &#x2013; mouse bindings and different uses of the mouse</li></ul></li><li><a href="http://www.emacswiki.org/emacs/CategoryPaths" class="local">Paths</a> &#x2013; how to specify OS paths in Emacs</li><li><a href="http://www.emacswiki.org/emacs/CategoryPersistence" class="local">Persistence</a> &#x2013; saving state between Emacs sessions</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryWindows">Windows</a> &#x2013; Emacs <a class="local" href="http://www.emacswiki.org/emacs/window">window</a>s (panes within a <a class="local" href="http://www.emacswiki.org/emacs/frame">frame</a>)</li></ul></li><li><a href="http://www.emacswiki.org/emacs/CategoryEditing" class="local">Editing</a> &#x2013; miscellaneous information about text editing<ul><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryAlignment">Alignment</a> &#x2013; align text, columns, comments or other programming-language constructs</li><li><a href="http://www.emacswiki.org/emacs/CategoryComments" class="local">Comments</a> &#x2013; manipulating and using code comments</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryFilling">Filling</a> &#x2013; paragraph filling, justification, and line wrapping text</li><li><a href="http://www.emacswiki.org/emacs/CategoryIndentation" class="local">Indentation</a> &#x2013; indenting text, including source code</li><li><a href="http://www.emacswiki.org/emacs/CategoryParentheses" class="local">Parentheses</a> &#x2013; showing parenthesis matches and mismatches</li><li><a href="http://www.emacswiki.org/emacs/CategoryRegion" class="local">Region</a> &#x2013; selecting a <a class="local" href="http://www.emacswiki.org/emacs/region">region</a> of text and acting on it (copy, cut, paste, &#x2026;)</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategorySpelling">Spelling</a> &#x2013; spell-checking</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryTemplates">Templates</a> &#x2013; using canned text (file headers, templates, forms)</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryUndo">Undo</a> &#x2013; undoing, redoing and finding changes</li></ul></li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryFiles">Files</a> &#x2013; files and directories: local, remote, backup<ul><li><a href="http://www.emacswiki.org/emacs/CategoryDirectories" class="local">Directories</a> &#x2013; <strong>Dired</strong> and operating on files and directories (folders)</li></ul></li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryHideStuff">HideStuff</a> &#x2013; hiding parts of a <a href="http://www.emacswiki.org/emacs/buffer" class="local">buffer</a><ul><li><a href="http://www.emacswiki.org/emacs/CategoryOutline" class="local">Outline</a> &#x2013; hiding structural parts of text: outlining and folding</li></ul></li><li><a href="http://www.emacswiki.org/emacs/CategoryModes" class="local">Modes</a> &#x2013; references, tips, documentation, and extensions for all modes<ul><li><a href="http://www.emacswiki.org/emacs/CategoryHypermedia" class="local">Hypermedia</a> &#x2013; creating and using hypertext: Emacs <a href="http://www.emacswiki.org/emacs/Info" class="local">Info</a>, HTML, wikis<ul><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryXML">XML</a> &#x2013; XML technologies</li></ul></li><li><a href="http://www.emacswiki.org/emacs/CategorySql" class="local">Sql</a> &#x2013; SQL and databases</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryTables">Tables</a> &#x2013; working with tabular data</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryTex">Tex</a> &#x2013; TeX and LaTeX stuff</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryESS">ESS</a> &#x2013; Emacs Speaks Statistics</li></ul></li><li><a href="http://www.emacswiki.org/emacs/CategoryMenus" class="local">Menus</a> &#x2013; Emacs menus, (<a class="local" href="http://www.emacswiki.org/emacs/menu_bar">menu bar</a> and popup)</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryPrinting">Printing</a> &#x2013; printing files, <a class="local" href="http://www.emacswiki.org/emacs/buffer">buffer</a>s, the <a href="http://www.emacswiki.org/emacs/region" class="local">region</a> &#x2026;</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryProject">Project Organization</a> &#x2013; navigating, visualizing, managing software projects</li><li><a href="http://www.emacswiki.org/emacs/CategoryProgramming" class="local">Programming</a> &#x2013; using Emacs for programming</li><li><a href="http://www.emacswiki.org/emacs/CategoryRegexp" class="local">Regexp</a> &#x2013; defining and using <a href="http://www.emacswiki.org/emacs/regular_expression" class="local">regular expression</a>s</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategorySearchAndReplace">SearchAndReplace</a> - searching and replacing text, including <a class="local" href="http://www.emacswiki.org/emacs/regexp">regexp</a> search</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryWriting">Writing</a> &#x2013; using Emacs and other tools to write text</li></ul><p><a class="anchor" name="ExternalPrograms"></a> External Programs and Remote Services:</p><ul><li><a href="http://www.emacswiki.org/emacs/CategoryArtificialIntelligence" class="local">ArtificialIntelligence</a> &#x2013; Emacs-based AI and expert systems.</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryCalculators">Calculators</a> &#x2013; math operations<ul><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryFinancial">Financial</a> &#x2013; money management and accounting</li></ul></li><li><a href="http://www.emacswiki.org/emacs/CategoryCalendar" class="local">Calendar</a> &#x2013; calendar, diary, task (appointment) reminders<ul><li><a href="http://www.emacswiki.org/emacs/CategoryTodo" class="local">Todo</a> &#x2013; maintaining to-do lists</li><li><a href="http://www.emacswiki.org/emacs/CategoryTimeTracking" class="local">TimeTracking</a> &#x2013; tracking your time spent</li></ul></li><li><a href="http://www.emacswiki.org/emacs/CategoryEducation" class="local">Education</a> &#x2013; learn something new, use a dictionary, or grade students</li><li><a href="http://www.emacswiki.org/emacs/CategoryEmulation" class="local">Emulation</a> &#x2013; emulating environments of other systems and software in Emacs</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryExternalUtilities">ExternalUtilities</a> &#x2013; using external utilities for other than programming<ul><li><a href="http://www.emacswiki.org/emacs/CategoryCryptography" class="local">Cryptography</a> &#x2013; encrypt and decrypt files you edit</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryShell">Shell</a> &#x2013; interact with a shell inside Emacs</li><li><a href="http://www.emacswiki.org/emacs/CategoryEshell" class="local">Eshell</a> &#x2013; a shell implemented in <a href="http://www.emacswiki.org/emacs/EmacsLisp" class="local">EmacsLisp</a></li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryVersionControl">VersionControl</a> &#x2013; using configuration-control (source-control) systems in Emacs (CVS, RCS, SCCS,&#x2026;)</li></ul></li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryDatabase">Databases</a> &#x2013; databases in Emacs</li><li><a href="http://www.emacswiki.org/emacs/CategoryGames" class="local">Games</a> &#x2013; play in Emacs</li><li><a href="http://www.emacswiki.org/emacs/CategoryInterface" class="local">Interface</a> &#x2013; accessing online utilities<ul><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryChatClient">ChatClient</a> &#x2013; using Emacs for chatting</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryJournaling">Journaling</a> &#x2013; Emacs interfaces to blogs</li></ul></li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryMail">Mail</a> &#x2013; reading email in Emacs<ul><li><a href="http://www.emacswiki.org/emacs/CategoryGnus" class="local">Gnus</a> &#x2013; an Emacs reader of news and mail</li><li><a href="http://www.emacswiki.org/emacs/CategoryMailAddons" class="local">MailAddons</a> &#x2013; mail-handling add-ons (not Gnus-related).</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryViewMail">View Mail</a> &#x2013; VM is an mail package that is an alternative to <a href="http://www.emacswiki.org/emacs/Rmail" class="local">Rmail</a></li><li><a class="local" href="http://www.emacswiki.org/emacs/WanderLust">WanderLust</a> &#x2013; another Emacs reader of news and mail.</li></ul></li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryPersonalInformationManager">PersonalInformationManager</a> &#x2013; PIM functionalities<ul><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryBbdb">Bbdb</a> &#x2013; &#x201c;Big Brother DataBase&#x201d;: maintaining phone numbers, mail addresses</li></ul></li><li><a href="http://www.emacswiki.org/emacs/CategoryProgrammerUtils" class="local">ProgrammerUtils</a> &#x2013; tools for programmers (e.g. code browsers)</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryRelated">Related</a> &#x2013; Emacs environments run in other programs (browsers, terminal emulators,&#x2026;)</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryRemoteEmacs">RemoteEmacs</a> &#x2013; running Emacs on a remote host</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryWebBrowser">WebBrowser</a> &#x2013; browsing Web files and sites</li></ul><p><a class="anchor" name="ProgrammingEmacs"></a> Programming Emacs in Lisp and C Source Code:</p><ul><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryCode">Code</a> &#x2013; <a href="http://www.emacswiki.org/emacs/EmacsLisp" class="local">EmacsLisp</a> coding tips</li><li><a href="http://www.emacswiki.org/emacs/CategoryDebug" class="local">Debug</a> &#x2013; debugging Emacs, debugging with Emacs, debugging <a class="local" href="http://www.emacswiki.org/emacs/EmacsLisp">EmacsLisp</a></li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryPatches">Patches</a> &#x2013; patches to Emacs, mostly for C-level extensions</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryExtensionLanguage">ExtensionLanguage</a> &#x2013; extending Emacs using other languages besides <a href="http://www.emacswiki.org/emacs/EmacsLisp" class="local">EmacsLisp</a>: Guile, Erlang, Python</li></ul><p><a class="anchor" name="Bugs"></a> Emacs Bugs, Wish List:</p><ul><li><a href="http://www.emacswiki.org/emacs/EmacsBugs" class="local">EmacsBugs</a> &#x2013; how to report bugs and where to find a list of already reported bugs</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryWishList">WishList</a> &#x2013; &#x201c;Emacs isn&#x2019;t perfect already?&#x201d;</li></ul><p><a class="anchor" name="EmacsCommunity"></a> Emacs Community:</p><ul><li><a href="http://www.emacswiki.org/emacs/EmacsImplementations" class="local">EmacsImplementations</a> &#x2013; a list of Emacsen and their impersonators</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryHistory">History</a> &#x2013; history of Emacs</li><li><a class="local" href="http://www.emacswiki.org/emacs/CategoryHomepage">Homepage</a> &#x2013; home pages of Emacs friends, including <strong>you</strong></li><li><a href="http://www.emacswiki.org/emacs/CategoryHumor" class="local">Humor</a> &#x2013; when some Emacs users are not customizing Emacs, they make funnies</li></ul><hr /><p><a class="local" href="http://www.emacswiki.org/emacs/CategoryEmacsWikiSite">CategoryEmacsWikiSite</a></p></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="translation bar"><br /> <a class="translation ja" href="http://www.emacswiki.org/emacs-ja/サイトマップ">日本語</a> <a class="translation fr" href="http://www.emacswiki.org/emacs-fr/PlanDuSite">Français</a> <a class="translation ru" href="http://www.emacswiki.org/emacs-ru/КартаСайта">Русский</a> <a href="http://www.emacswiki.org/emacs-ko/대문" class="translation ko">한국어</a> <a class="translation se" href="http://www.emacswiki.org/emacs-se/InnehållsFörteckning">Svenska</a> <a href="http://www.emacswiki.org/emacs-it/Mappa_del_sito" class="translation it">Italiano</a> <a class="translation es" href="http://www.emacswiki.org/emacs-es/MapaDelSitio">Español</a> <a class="translation pt" href="http://www.emacswiki.org/emacs-pt/MapaDoSite">Português</a> <a class="translation de" href="http://www.emacswiki.org/emacs-de/Übersicht">Deutsch</a> <a href="http://www.emacswiki.org/emacs-zh/網站地圖" class="translation zh">中文</a> <a rel="nofollow" class="translation new" href="http://www.emacswiki.org/emacs?action=translate;id=SiteMap;missing=en_uk">Add Translation</a></span><div class="edit bar"><a accesskey="c" class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_SiteMap">Talk</a> <a rel="nofollow" title="Click to edit this page" class="edit" href="http://www.emacswiki.org/emacs?action=edit;id=SiteMap" accesskey="e">Edit this page</a> <a class="history" href="http://www.emacswiki.org/emacs?action=history;id=SiteMap" rel="nofollow">View other revisions</a> <a rel="nofollow" class="admin" href="http://www.emacswiki.org/emacs?action=admin;id=SiteMap">Administration</a></div><div class="time">Last edited 2014-09-28 16:44 UTC by <a class="author" href="http://www.emacswiki.org/emacs/DrewAdams" title="24.5.187.146">DrewAdams</a> <a href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=SiteMap" class="diff" rel="nofollow">(diff)</a></div><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>

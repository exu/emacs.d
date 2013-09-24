(require 'elfeed)
(global-set-key (kbd "C-x w") 'elfeed)

;; word wrap
(add-hook 'elfeed-show-mode-hook 'visual-line-mode)

;; default search filter on elfeed start without spam
(setq elfeed-search-filter "@1-week-ago -spam +unread")

;; RSS Atom Feeds
(setq elfeed-feeds
      (quote
       (
        "http://www.infopraca.pl/jobseeker/search.php?rss=Live&Keywords=php&Category=&SubRegion=15"
        "http://www.pracuj.pl/OFERTYPRACY/rss.aspx?SE=1&KW=PHP&H=20FB4A85E44401974EC026DEFBD7DB8B&R=15&C=3000014,3000015,3000018&EID=0&RCT=0&FP=%22php%22"
        "http://www.phpdeveloper.org/phpdev.rdf"
        "http://everzet.com/rss"
        "http://we-love-php.blogspot.com/feeds/posts/default"
        "http://www.dzone.com/links/feed/frontpage/php/rss.xml"
        "http://feeds.feedburner.com/symfony/blog"
        "http://feeds.feedburner.com/nelmio"
        "http://feeds.feedburner.com/Inchoo"
        "http://bredemeyer.com/RequisiteVariety/?feed=rss2"
        "http://blog.sei.cmu.edu/feeds/rss.cfm"
        "http://sketchnotearmy.com/blog/atom.xml"
        "http://feeds.apigee.com/ApigeeBlog"
        "http://feeds.feedburner.com/UdiDahan-TheSoftwareSimplist"
        "http://blogs.pmi.org/blog/voices_on_project_management/atom.xml"
        "http://www.thepassionateprojectmanager.com/feed/"
        "http://www.projectcomplete.pl/blog/rss"
        "http://feeds.feedburner.com/thecriticalpath/DyPm"
        "http://feeds.feedburner.com/agilecommons/commonsblog"
        "http://feeds.feedburner.com/ajaxian"
        "http://planet.emacsen.org/atom.xml"
        "http://whattheemacsd.com/atom.xml"
        "http://vickychijwani.github.com/rss.xml"
        "http://wikigames.ubuntu.pl/?q=rss.xml"
        "http://feeds.feedburner.com/BlogOLinuxUbuntu"
        "http://distrowatch.com/news/dw.xml"
        "http://www.linuxinsider.com/perl/syndication/rssfull.pl"
        "http://www.linux.com/feeds/all-content"
        "http://www.tuxradar.com/frontpage/feed"
        "http://feeds.feedburner.com/Linux_User"
        "http://feeds.cyberciti.biz/Nixcraft-LinuxFreebsdSolarisTipsTricks"
        "http://jakilinux.org/feed/"
        "http://www.archlinux.org/feeds/news/"
        "http://jakilinux.org/category/newsy/feed/"
        "http://www.dzone.com/links/feed/frontpage/unix-linux/rss.xml"
        "http://rss.7thguard.net/7thguard.xml"
        "http://www.linux.pl/rss.php"
        "http://fullcirclemagazine.org/feed/"
        "http://www.howtoforge.com/node/feed"
        "http://www.markshuttleworth.com/feed"
        "http://www.ubuntugeek.com/feed/"
        "http://feeds.feedburner.com/ubuntu-czytelnia"
        "http://hacking.pl/rss.xml"
        "http://freeworld.thc.org/rss.xml.php"
        "http://theinvisiblethings.blogspot.com/feeds/posts/default?alt=rss"
        "http://feeds.feedburner.com/HCSL"
        "http://feeds.feedburner.com/niebezpiecznik"
        "http://securityweb.org/feed/"
        "http://vizzdoom.net/feed/"
        "http://secunia.com/blog_rss/o.rss"
        "http://www.zone-h.org/index2.php?option=com_rss&no_html=1"
        "http://feeds.feedburner.com/Hackosis"
        "http://www.networkworld.com/rss/security.xml"
        "http://sekurak.pl/feed/"
        "http://php-security.org/feed/"
        "http://feedproxy.google.com/piko"
        "http://feeds.feedburner.com/KrebsOnSecurity"
        "http://feeds.feedburner.com/gnucitizen"
        "http://www.cert.pl/rss_feed.xml"
        "http://ha.ckers.org/blog/feed/"
        "http://xssed.com/news.rss"
        "http://kopalniawiedzy.pl/wiadomosci.rss"
        "http://minds.pl/index2.php?option=ds-syndicate&version=1&feed_id=1"
        "http://www.geekweek.pl/feed/"
        "http://kasia-gotuje.pl/rss"
        "http://www.poznan.pl/mim/public/feeds/rss.xml?name=msp"
        "http://vimeo.com/channels/142981/videos/rss"
        "http://howtonode.org/feed.xml"
        "http://www.dzone.com/links/feed/search/nodejs/rss.xml"
        "http://feeds.feedburner.com/nodejs/123123123"
        "http://nodetuts.com/rss.xml"
        "http://tjholowaychuk.com/rss"
        "http://feeds.feedburner.com/RubyQuicktips"
        "http://www.scala-lang.org/rss.xml"
        "http://feeds.feedburner.com/thechangelog"
        "http://www.ruby-lang.org/en/feeds/news.rss"
        "http://feeds.feedburner.com/RubyInside"
        "http://feeds.feedburner.com/rubyshow"
        "http://ajaxian.com/index.xml"
        "http://feeds.feedburner.com/GiantRobotsSmashingIntoOtherGiantRobots"
        "http://www.engineyard.com/blog/feed/"
        "http://feedproxy.google.com/TheRailsWay"
        "http://www.dzone.com/feed/frontpage/ruby/rss.xml"
        "http://www.dzone.com/links/feed/frontpage/python/rss.xml"
        "http://www.planetscala.com/atom.xml"
        "http://www.wykop.pl/rss/index.xml"
        "http://feeds.feedburner.com/GeekAndPoke"
        "http://xkcd.com/rss.xml"
        "http://www.joemonster.org/backend.php"
        "http://www.zuchrysuje.pl/index.php/feed/"
        "http://boli.blog.pl/index.rss"
        "http://bash.org.pl/rss"
        "http://zuch.blox.pl/rss2"
        "http://web20.pl/?feed=rss2"
        "http://pl.engadget.com/rss.xml"
        "http://feeds.feedburner.com/GoogleOperatingSystem"
        "http://www.webhosting.pl/feed/rss/all"
        "http://feeds.cybernetnews.com/CyberNet"
        "http://blogs.msdn.com/ie/atom.xml"
        "http://www.dzone.com/links/feed/frontpage/web%20design/rss.xml"
        "http://yehudakatz.com/feed/"
        "http://weierophinney.net/matthew/feeds/index.rss2"
        "http://feeds.feedburner.com/catonmat"
        "http://tirania.org/blog/miguel.rss2"
        "http://blog.ekini.net/feed/"
        "http://feeds.feedburner.com/SubbuDotOrg"
        "http://feeds.feedburner.com/railstips"
        "http://feeds.feedburner.com/VivekHaldar"
        "http://blog.qcadoo.com/tech/feed/"
        "http://blogs.msdn.com/b/interoperability/rss.aspx"
        "http://feeds2.feedburner.com/allTrades"
        "http://feeds.feedburner.com/Gimptutorials"
        "http://feeds.feedburner.com/nettuts"
        "http://martinfowler.com/feed.atom"
        "http://rss1.smashingmagazine.com/feed/?f=coding-std"
        "http://feeds.feedburner.com/devblogi"
        "http://feeds.feedburner.com/RidingRails"
        "http://feeds.feedburner.com/railscasts"
        "http://www.joezimjs.com/feed/"
        "http://asciicasts.com/episodes.xml"
        "http://feeds.feedburner.com/screencastsorg"
        "http://feeds.feedburner.com/InvisibleToTheEye"
        "http://feeds.feedburner.com/lococast"
        "http://blog.martinfjordvald.com/feed/"
        "http://feeds.feedburner.com/PostgresOnlineJournal"
        "http://www.awwwards.com/feed"
        "http://feeds.feedburner.com/CssTricks"
        "http://feeds.feedburner.com/WebReflection"
        "http://feeds.feedburner.com/TutorialShock"

        "http://mojeneony.blogspot.com/feeds/posts/default"
        "http://symfony2tips.blogspot.com/feeds/posts/default"
        "http://jackcoughonsoftware.blogspot.com/feeds/posts/default"

        )))


;; tagging new feeds
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :before "2 weeks ago"
                                                     :remove 'unread))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "pracuj" :add '(work)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "praca" :add '(work)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "php" :add '(dev php)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "everzet" :add '(dev php)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "symfony/blog" :add '(dev php)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "nelmio" :add '(dev php)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "Inchoo" :add '(dev php)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "RecessFramework" :add '(dev php)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "bredemeyer" :add '(architecture)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "blog\\.sei\\.cmu\\.edu" :add '(architecture)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "sketchnotearmy\\.com" :add '(architecture)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "feeds\\.apigee\\.com" :add '(architecture)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "UdiDahan-TheSoftwareSimplist" :add '(architecture)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "blogs\\.pmi\\.org" :add '(pm)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "thepassionateprojectmanager" :add '(pm)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "projectcomplete" :add '(pm)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "thecriticalpath/DyPm" :add '(pm)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "agilecommons/commonsblog" :add '(pm)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "ajaxian" :add '(dev js)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "BrandonAaron" :add '(dev js)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "planet\\.emacsen\\.org" :add '(dev workflow)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "whattheemacsd" :add '(dev workflow)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "vickychijwani" :add '(dev workflow)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "linux" :add '(os linux)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "ubuntu" :add '(os linux ubuntu)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "Linux" :add '(os linux)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "distrowatch" :add '(os linux)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "tuxradar" :add '(os linux)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "unix" :add '(os linux)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "fullcirclemagazine" :add '(os linux)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "howtoforge" :add '(os linux)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "markshuttleworth" :add '(os linux)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "hacking" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "security" :add '(security)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "freeworld" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "theinvisiblethings" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "HCSL" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "niebezpiecznik" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "securityweb" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "anonops" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "vizzdoom" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "secunia" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "zone-h" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "Hackosis" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "sekurak" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "piko" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "Security" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "gnucitizen" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "cert\\.pl" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "ha\\.ckers\\.org" :add '(security)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "xssed" :add '(security)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "kopalniawiedzy" :add '(news spam knowledge)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "minds\\.pl" :add '(news spam knowledge)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "geekweek" :add '(news spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "kasia-gotuje" :add '(news food)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "poznan" :add '(news spam local)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "node" :add '(dev nodejs)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "nodejs" :add '(dev nodejs)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "channels/142981" :add '(dev nodejs)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "tjholowaychuk" :add '(dev nodejs)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "ruby" :add '(dev ruby)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "scala" :add '(dev scala)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "python" :add '(dev python)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "java" :add '(dev java)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "thechangelog" :add '(dev ruby)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "ajaxian" :add '(dev ruby)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "GiantRobots" :add '(dev ruby)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "engineyard" :add '(dev ruby)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "TheRailsWay" :add '(dev ruby)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "blogs\\.msdn\\.com" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "web%20design" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "yehudakatz" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "weierophinney" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "catonmat" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "tirania" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "blog" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "SubbuDotOrg" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "railstips" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "VivekHaldar" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "blog\\.qcadoo\\.com" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "interoperability" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "allTrades" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "Gimptutorials" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "nettuts" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "martinfowler\\.com/feed\\.atom" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "smashingmagazine" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "devblogi" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "RidingRails" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "railscasts" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "joezimjs" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "asciicasts" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "screencastsorg" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "InvisibleToTheEye" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "lococast" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "martinfjordvald" :add '(dev common)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "PostgresOnlineJournal" :add '(dev common)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "awwwards" :add '(dev clientside)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "CssTricks" :add '(dev clientside)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "WebReflection" :add '(dev clientside)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "TutorialShock" :add '(dev clientside)))


(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "wykop" :add '(entertainment spam)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "GeekAndPoke" :add '(fun spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "xkcd" :add '(fun spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "joemonster" :add '(fun spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "zuchrysuje" :add '(fun spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "boli" :add '(fun spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "bash" :add '(fun spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "zuch" :add '(fun spam)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "web20" :add '(it-news spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "engadget" :add '(it-news spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "GoogleOperatingSystem" :add '(it-news)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "webhosting" :add '(it-news spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "cybernetnews" :add '(it-news spam)))

(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "mojeneony" :add '(other spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "symfony2tips" :add '(other spam)))
(add-hook 'elfeed-new-entry-hook (elfeed-make-tagger :feed-url "jackcoughonsoftware" :add '(other spam)))

(require 'projectile)
(projectile-global-mode 1)
(setq projectile-enable-caching t)
(setq projectile-tags-command "~/bin/scripts/php_etags")
(setq tags-revert-without-query 1)

(setq projects
      (list
       "~/.emacs.d"
       "~/.emacs.d/snippets/"
       "~/.emacs.d/config/"
       "~/.emacs.d/vendor/"
       "~/Dropbox/Dotfiles/scripts"

       "~/org/wiki/"
       "~/Dropbox/Dotfiles/"

       "~/src/bitbucket.org/exu/tests"
       "~/src/bitbucket.org/exu/reg"
       "~/src/bitbucket.org/exu/kasia.in"
       "~/src/bitbucket.org/exu/kgo"

       "~/src/github.com/exu/bddgo/"
       "~/src/github.com/exu/beeapi/"
       "~/src/github.com/exu/emacs.d"
       "~/src/github.com/exu/event-monitor-behat-extension"
       "~/src/github.com/exu/exu-emacs-custom-snippets"
       "~/src/github.com/exu/exu.github.com"
       "~/src/github.com/exu/blog"
       "~/src/github.com/exu/factory-girl-php"
       "~/src/github.com/exu/galeriana"
       "~/src/github.com/exu/gitlab-ci"
       "~/src/github.com/exu/gitlabhq"
       "~/src/github.com/exu/go_design_pattern"
       "~/src/github.com/exu/goimgdata"
       "~/src/github.com/exu/go-koans"
       "~/src/github.com/exu/php-battlefield"
       "~/src/github.com/exu/gooker"
       "~/src/github.com/exu/hateoas-training-ground"
       "~/src/github.com/exu/jsbdds"
       "~/src/github.com/exu/node-redmine"
       "~/src/github.com/exu/pgsql.vim"
       "~/src/github.com/exu/php-12bdds"
       "~/src/github.com/exu/php-bdd-bootstrap"
       "~/src/github.com/exu/php-bdd-parser-example"
       "~/src/github.com/exu/php-benchmark"
       "~/src/github.com/exu/phpspec-playground"
       "~/src/github.com/exu/phpspec-training-ground"
       "~/src/github.com/exu/poligon"
       "~/src/github.com/exu/projectile"
       "~/src/github.com/exu/puppet-symfony"
       "~/src/github.com/exu/riddle"
       "~/src/github.com/exu/simple-rails-multi-tenancy"
       "~/src/github.com/exu/site-monitor"
       "~/src/github.com/exu/slownie.js"
       "~/src/github.com/exu/spring-playgound"
       "~/src/github.com/exu/stable-roommates"
       "~/src/github.com/exu/til"

       "~/src/ioki.com.pl/tech-radar/"

       "~/src/github.com/exu/go-workshops/"
       "~/src/github.com/exu/docker-training"
       "~/src/github.com/ArdanStudios/gotraining"

       "~/src/ioki.com.pl/ioki-packagist"
       "~/src/ioki.com.pl/queue-monitor"
       "~/src/ioki.com.pl/docker-nmel/"
       "~/src/ioki.com.pl/piat"

       "~/src/ioki.com.pl/perf/gatling-report-compare"


       "~/src/ioki.com.pl/mel1"
       "~/src/ioki.com.pl/mel2"
       "~/src/ioki.com.pl/mel3"
       "~/src/ioki.com.pl/mel4"
       "~/src/ioki.com.pl/warroom"

       "~/src/ioki.com.pl/excel-ei"
       "~/src/ioki.com.pl/perf/perf_gen"
       "~/src/ioki.com.pl/perf/perf_data_gem"
       "~/src/ioki.com.pl/perf/perf_tests"
       "~/src/ioki.com.pl/perf/nperf-injectors"

       "~/src/ioki.com.pl/prod-restorer"
       "~/src/ioki.com.pl/docker-simple"

       "/etc/nginx/"
       "/etc/php"

       "~/src/github.com/exu/mongou"
       "~/src/github.com/exu/emacs-org"

       "~/src/ioki.com.pl/docker-images"

       "~/src/local/archive/firmarozalczyk"

       )
      )

(setq files
      (list
       "~/src/mongo.js"
       "~/.emacs.d/init.el"
       "~/.emacs.d/config/keys.el"
       "~/.emacs.d/config/projects.el"
       "/etc/hosts"
       "/etc/nginx/nginx.conf"
       "/etc/nginx/vhosts.d/nmel.conf"
       "/etc/nginx/vhosts.d/kasia.conf"
       "/etc/php/php.ini"
       "~/.zshrc"
       "~/.xprofile"
       "~/.i3/config"
       "~/Dropbox/Dotfiles/arch_install"
       "~/Dropbox/Dotfiles/install"
       "~/bin/scripts/nmel_test_current"
       "~/.aliases"
       "~/.Xresources"
       "~/.ssh/config"
       )
      )


(defun cd-and-visit (directory)
  (interactive "DEnter directory name: ")
  (cd directory)
  (tags-reset-tags-tables)
  (setq tags-table-list (list directory))
  (gpicker-visit-project directory)

  (if (file-exists-p (concat directory "/.jshintrc"))
      (progn
        (setq jshint-configuration-path (concat directory "/.jshintrc"))
        (message (concat "loading .jshintrc from: " jshint-configuration-path))
        )
      )

  (message (concat "Switching to " directory) )
  )

(defun cdp (directory)
  (interactive "DEnter directory name: ")
  (cd-and-visit directory)
  )

(defun cd-and-git-status (directory)
  (interactive "DEnter directory name: ")
  (cd-and-visit directory)
  (magit-status directory)
  )


(defun ido-open-file ()
  (interactive)
  (setq file-name (ido-completing-read "Open file: " files))
  (find-file file-name)
  )


(defun ido-switch-project ()
  (interactive)
  (setq project-directory (ido-completing-read "Switch to project: " projects))
  (cd-and-visit project-directory)
  )

(defun ido-switch-project-and-git-status ()
  (interactive)
  (setq project-directory (ido-completing-read "Switch to project and git status: " projects))
  (cd-and-git-status project-directory)
  )

(defun dired-in-project-directory ()
  (interactive)
  (setq project-directory (ido-completing-read "Open project directory: " projects))
  (dired project-directory)
  )

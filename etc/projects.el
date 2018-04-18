(setq projects
      (list
       "~/.emacs.d"
       "~/.emacs.d/snippets/"
       "~/.emacs.d/config/"
       "~/.emacs.d/vendor/"

       "~/workspace/ioki-packagist"
       "~/org/wiki/"
       "~/Dropbox/Dotfiles/"

       "~/go/src/bitbucket.org/exu/go-bee-api"
       "~/go/src/bitbucket.org/exu/go-kasia"
       "~/go/src/bitbucket.org/exu/go-pure-kasia"
       "~/go/src/bitbucket.org/exu/mux-kasia"
       "~/go/src/bitbucket.org/exu/tests"
       "~/go/src/github.com/exu/bddgo/"
       "~/go/src/github.com/exu/beeapi/"

       "~/workspace/github/angular-phonecat"
       "~/workspace/github/angular-seed"
       "~/workspace/github/awesome-arch"
       "~/workspace/github/awesome-copycats"
       "~/workspace/github/awesome-dotfiles"
       "~/workspace/github/bddgo"
       "~/workspace/github/bundle-skeleton"
       "~/workspace/github/clone"
       "~/workspace/github/Docter"
       "~/workspace/github/egghead"
       "~/workspace/github/emacs.d"
       "~/workspace/github/event-monitor-behat-extension"
       "~/workspace/github/exu-emacs-custom-snippets"
       "~/workspace/github/exu.github.com"
       "~/workspace/github/factory-girl-php"
       "~/workspace/github/galeriana"
       "~/workspace/github/gitlab-ci"
       "~/workspace/github/gitlabhq"
       "~/workspace/github/go_design_pattern"
       "~/workspace/github/goimgdata"
       "~/workspace/github/go-koans"
       "~/workspace/github/gooker"
       "~/workspace/github/go-playground"
       "~/workspace/github/hateoas-training-ground"
       "~/workspace/github/jsbdds"
       "~/workspace/github/lisp-koans"
       "~/workspace/github/nodejs-mail-notifier"
       "~/workspace/github/node-redmine"
       "~/workspace/github/perf-playground"
       "~/workspace/github/pgsql.vim"
       "~/workspace/github/php-12bdds"
       "~/workspace/github/php-bdd-bootstrap"
       "~/workspace/github/php-bdd-parser-example"
       "~/workspace/github/php-benchmark"
       "~/workspace/github/phpspec-playground"
       "~/workspace/github/phpspec-training-ground"
       "~/workspace/github/poligon"
       "~/workspace/github/projectile"
       "~/workspace/github/puppet-symfony"
       "~/workspace/github/riddle"
       "~/workspace/github/simple-rails-multi-tenancy"
       "~/workspace/github/site-monitor"
       "~/workspace/github/slownie.js"
       "~/workspace/github/spring-playgound"
       "~/workspace/github/stable-roommates"
       "~/workspace/github/stx-python-workshop"
       "~/workspace/github/symfony2-console-standalone"
       "~/workspace/github/symfony2-jobeet"
       "~/workspace/github/symfony2-rad-training"
       "~/workspace/github/symfony-hateoas-sandbox"
       "~/workspace/github/try_git"
       "~/workspace/github/vagrant-puppet-boilerplate"
       "~/workspace/github/vim-dotfiles"
       "~/workspace/github/vim-img2data"
       "~/workspace/github/vim-python_koans"
       "~/workspace/github/vim-ultisnips-snippets"

       "~/workspace/projects/firmarozalczyk"
       "~/workspace/kasia.in"
       "~/workspace/projects/mieszalnia"
       "~/workspace/projects/kreisel-mssql"
       "~/workspace/projects/rach"

       "~/workspace/nmel-docker/"
       "~/workspace/piat"
       "~/workspace/ngmel-dev"
       "~/workspace/ngmel-prod"
       "~/workspace/ngmel-test"
       "~/workspace/github/perf-playground/locustio"
       "~/workspace/nperf-injectors"

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

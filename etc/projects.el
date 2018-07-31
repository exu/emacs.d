(require 'projectile)

;; (setq projectile-enable-caching t)
;; (setq projectile-tags-command "~/bin/scripts/php_etags")

(setq tags-revert-without-query 1)

(setq projects
      (list
       "~/src/github.com/exu/python-playground"
       "~/src/github.com/exu/architecture-playground"
       "~/src/github.com/exu/apex0"
       "~/.emacs.d"
       "~/.emacs.d/snippets/"
       "~/.emacs.d/etc/"
       "~/.emacs.d/vendor/"
       "~/Dropbox/Dotfiles/scripts"

       "~/org/wiki/"
       "~/Dropbox/Dotfiles/"

       "~/src/bitbucket.org/exu/tests"
       "~/src/bitbucket.org/exu/reg"
       "~/src/bitbucket.org/exu/kasia.in"
       "~/src/bitbucket.org/exu/kgo"
       "~/src/bitbucket.org/exu/aquabellis"
       "~/src/bitbucket.org/exu/olx-task"
       "~/src/bitbucket.org/exu/coderslab.pl/Symfony/src"
       "~/src/bitbucket.org/exu/coderslab.pl/Symfony/projects/message-board/"
       "~/src/github.com/exu/emacs.d"
       "~/src/github.com/exu/event-monitor-behat-extension"
       "~/src/github.com/exu/exu-emacs-custom-snippets"
       "~/src/github.com/exu/exu.github.com"
       "~/src/github.com/exu/blog"
       "~/src/github.com/exu/go-xrandr"
       ;; "~/src/github.com/exu/factory-girl-php"
       ;; "~/src/github.com/exu/galeriana"
       ;; "~/src/github.com/exu/gitlab-ci"
       ;; "~/src/github.com/exu/gitlabhq"
       ;; "~/src/github.com/exu/go_design_pattern"
       "~/src/github.com/exu/goimgdata"
       "~/src/github.com/exu/go-koans"
       "~/src/github.com/exu/php-battlefield"
       ;; "~/src/github.com/exu/gooker"
       ;; "~/src/github.com/exu/hateoas-training-ground"
       ;; "~/src/github.com/exu/jsbdds"
       ;; "~/src/github.com/exu/node-redmine"
       ;; "~/src/github.com/exu/pgsql.vim"
       ;; "~/src/github.com/exu/php-12bdds"
       ;; "~/src/github.com/exu/php-bdd-bootstrap"
       ;; "~/src/github.com/exu/php-bdd-parser-example"
       ;; "~/src/github.com/exu/php-benchmark"
       ;; "~/src/github.com/exu/phpspec-playground"
       ;; "~/src/github.com/exu/phpspec-training-ground"
       "~/src/github.com/exu/poligon"
       ;; "~/src/github.com/exu/projectile"
       ;; "~/src/github.com/exu/puppet-symfony"
       ;; "~/src/github.com/exu/riddle"
       ;; "~/src/github.com/exu/simple-rails-multi-tenancy"
       ;; "~/src/github.com/exu/site-monitor"
       ;; "~/src/github.com/exu/slownie.js"
       ;; "~/src/github.com/exu/spring-playgound"
       ;; "~/src/github.com/exu/stable-roommates"
       "~/src/github.com/exu/til"
       "~/src/github.com/exu/qotd"


       "~/src/github.com/exu/go-workshops/"
       "~/src/github.com/exu/docker-training"
       "~/src/github.com/ArdanStudios/gotraining"

       "/etc/nginx/"
       "/etc/php"

       "~/src/github.com/exu/mongou"
       "~/src/github.com/exu/emacs-org"


       "~/src/github.com/exu/jira-timetracker"

       "~/src/local/archive/firmarozalczyk"
       "~/src/gerrit/mysql-online-changer/"
       "~/src/github.com/exu/golang-serverless-restapi"
       "~/src/bitbucket.pearson.com/jacewyso/vendoring"

       "~/src/kinguin.io/architecture"
       "~/src/kinguin.io/architecture/perf"
       "~/src/kinguin.io/architecture/example-go-service"
       "~/src/kinguin.io/architecture/service-catalog"
       "~/src/kinguin.io/playground/tyk-bundle-server"
       "~/src/kinguin.io/architecture/services"
       "~/src/kinguin.io/server/k8s/tyk/"
       "~/src/kinguin.io/k8s/helm/"
       "~/src/kinguin.io/architecture/chartmuseum-pusher"
       "~/src/kinguin.io/architecture/currency-service"
       )
      )

(dolist (p projects) (projectile-add-known-project p))

(setq files
      (list
       "~/src/mongo.js"
       "~/.emacs.d/init.el"
       "~/.emacs.d/etc/keys.el"
       "~/.emacs.d/etc/projects.el"
       "~/.emacs.d/etc/packages.el"
       "~/.emacs.d/etc/setup.el"
       "/etc/hosts"
       "/etc/nginx/nginx.conf"
       "/etc/nginx/vhosts.d/nmel.conf"
       "/etc/nginx/vhosts.d/kasia.conf"
       "/etc/php/php.ini"
       "~/.zshrc"
       "~/.xprofile"
       "~/.config/i3/config"
       "~/.i3/config"
       "~/Dropbox/Dotfiles/arch_install"
       "~/Dropbox/Dotfiles/install"
       "~/.aliases"
       "~/.Xresources"
       "~/.ssh/config"
       )
      )



(defun cd-and-visit (directory)
  (interactive "DEnter directory name: ")
  (cd directory)
  (tags-reset-tags-tables)
  ;; (projectile-switch-project-by-name directory)
  (setq tags-table-list (list directory))
  (message (concat "Switching to " directory))
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

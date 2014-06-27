(require 'projectile)
(projectile-global-mode 1)
(setq projectile-enable-caching t)
(setq projectile-tags-command "~/bin/php_etags")
(setq tags-revert-without-query 1)


(setq projects
      (list

       "~/.emacs.d"
       "~/.emacs.d/snippets/"
       "~/.emacs.d/config/"
       "~/.emacs.d/vendor/"

       "~/Dropbox/Firma/generator"

       "~/go/src/github.com/exu/go-playground"
       "~/go/src/github.com/exu/bddgo/"
       "~/go/src/github.com/edpauto/urlopik-go-backend"

       "~/org/wiki/"

       "/srv/www/github/angular-phonecat"
       "/srv/www/github/angular-seed"
       "/srv/www/github/behat-em"
       "/srv/www/github/behat-sqlexecutor"
       "/srv/www/github/bundle-skeleton"
       "/srv/www/github/factory-girl-php"
       "/srv/www/github/php-bdd-bootstrap"
       "/srv/www/github/php-bdd-parser-example"
       "/srv/www/github/php-mode"
       "/srv/www/github/urlopik-backend/"

       "/srv/www/jsbdds"
       "/srv/www/php-bdds"

       "/srv/www/access-api"
       "/srv/www/architecture"
       "/srv/www/behat"
       "/srv/www/communication"
       "/srv/www/crm"
       "/srv/www/crm-api-client"
       "/srv/www/deployer"
       "/srv/www/db-restorer"
       "/srv/www/db-restore-extension"
       "/srv/www/doctrine-rest-extension"
       "/srv/www/emailparser"
       "/srv/www/exu.github.com"
       "/srv/www/exports"
       "/srv/www/firmarozalczyk"
       "/srv/www/external-forms"
       "/srv/www/gitlab-notifier"
       "/srv/www/iq-api-client"
       "/srv/www/iq_plugin"
       "/srv/www/jqgrid"
       "/srv/www/kasia.in"
       "/srv/www/libcom"
       "/srv/www/meerkat-qa"
       "/srv/www/mieszalnia"
       "/srv/www/mssql"
       "/srv/www/newlayout"
       "/srv/www/php-recruitment"
       "/srv/www/poligon"
       "/srv/www/poligon/go/koans"
       "/srv/www/poligon/js/angular"
       "/srv/www/qar.sn"
       "/srv/www/rach"
       "/srv/www/recalc"
       "/srv/www/rest-context-extension"
       "/srv/www/sylius"
       "/srv/www/doctrine-rest-controller"
       "/srv/www/selenium-runner-extension"
       "/srv/www/static"
       "/srv/www/stock-uploader-crx"
       "/srv/www/sql-executor-extension"

       "/srv/www/tools"
       "/srv/www/crontask"
       "/srv/www/migrator"
       "/srv/www/training/lisp-koans"
       "/srv/www/transactional-api"
       "/srv/www/typo-domains-redirector"
       "/srv/www/uri-monitor"
       "/srv/www/video-sync"
       "/srv/www/websites"
       "/srv/www/websites-pdo-context-extension"
       "/srv/www/google-referer-detector"

       ;; "/srv/www/rule-js-task/"
       ;; "/srv/www/training/hal"
       ;; "/srv/www/training/phpspec"
       ;; "/srv/www/training/rad"
       ;; "/srv/www/training/rest"
       ;; "/srv/www/training/symfony-hateoas-sandbox"

       "~/Java/spring-playgound"
       )
      )

(defun cd-and-visit (directory)
  (interactive "DEnter directory name: ")
  (cd directory)
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

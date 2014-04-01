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

       "~/www/github/angular-phonecat"
       "~/www/github/angular-seed"
       "~/www/github/behat-em"
       "~/www/github/behat-sqlexecutor"
       "~/www/github/bundle-skeleton"
       "~/www/github/factory-girl-php"
       "~/www/github/php-bdd-bootstrap"
       "~/www/github/php-bdd-parser-example"
       "~/www/github/php-mode"
       "~/www/github/urlopik-backend/"

       "~/www/jsbdds"
       "~/www/php-bdds"

       "~/www/access-api"
       "~/www/architecture"
       "~/www/behat"
       "~/www/communication"
       "~/www/crm"
       "~/www/crm-api-client"
       "~/www/deployer"
       "~/www/db-restorer"
       "~/www/db-restore-extension"
       "~/www/doctrine-rest-extension"
       "~/www/emailparser"
       "~/www/exu.github.com"
       "~/www/exports"
       "~/www/firmarozalczyk"
       "~/www/external-forms"
       "~/www/gitlab-notifier"
       "~/www/iq-api-client"
       "~/www/iq_plugin"
       "~/www/jqgrid"
       "~/www/kasia.in"
       "~/www/libcom"
       "~/www/mieszalnia"
       "~/www/mssql"
       "~/www/newlayout"
       "~/www/php-recruitment"
       "~/www/poligon"
       "~/www/poligon/go/koans"
       "~/www/poligon/js/angular"
       "~/www/qar.sn"
       "~/www/rach"
       "~/www/rest-context-extension"
       "~/www/doctrine-rest-controller"
       "~/www/selenium-runner-extension"
       "~/www/static"
       "~/www/stock-uploader-crx"
       "~/www/sql-executor-extension"

       "~/www/tools"
       "~/www/migrator"
       "~/www/training/lisp-koans"
       "~/www/transactional-api"
       "~/www/typo-domains-redirector"
       "~/www/uri-monitor"
       "~/www/video-sync"
       "~/www/websites"
       "~/www/websites-pdo-context-extension"
       "~/www/google-referer-detector"

       ;; "~/www/rule-js-task/"
       ;; "~/www/training/hal"
       ;; "~/www/training/phpspec"
       ;; "~/www/training/rad"
       ;; "~/www/training/rest"
       ;; "~/www/training/symfony-hateoas-sandbox"
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

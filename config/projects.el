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

       "~/org/wiki/"
       "~/Dropbox/Firma/generator"

       "~/go/src/github.com/exu/go-playground"
       "~/go/src/github.com/exu/bddgo/"
       "~/go/src/bitbucket.org/exu/go-kasia"
       "~/go/src/github.com/exu/beeapi/"

       "~/workspace/github/angular-phonecat"
       "~/workspace/github/angular-seed"
       "~/workspace/github/behat-em"
       "~/workspace/github/behat-sqlexecutor"
       "~/workspace/github/bundle-skeleton"
       "~/workspace/github/factory-girl-php"
       "~/workspace/github/php-bdd-bootstrap"
       "~/workspace/github/php-bdd-parser-example"
       "~/workspace/github/php-mode"
       "~/workspace/github/urlopik-backend/"

       "~/workspace/jsbdds"
       "~/workspace/php-bdds"

       "~/workspace/exu.github.com"
       "~/workspace/firmarozalczyk"
       "~/workspace/kasia.in"
       "~/workspace/mieszalnia"
       "~/workspace/mssql"
       "~/workspace/poligon"
       "~/workspace/poligon/go/koans"
       "~/workspace/poligon/js/angular"
       "~/workspace/poligon/python/python_koans/"
       "~/workspace/rach"

       "~/workspace/training/lisp-koans"

       "~/workspace/piat"
       "~/workspace/ngmel-dev"
       "~/workspace/ngmel-prod"
       "~/workspace/github/perf-playground/locustio"

       "~/workspace/kasia-tornado"
       "~/workspace/stableroommate"

       ;; "~/workspace/rule-js-task/"
       ;; "~/workspace/training/hal"
       ;; "~/workspace/training/phpspec
       ;; "~/workspace/training/rad"
       ;; "~/workspace/training/rest"
       ;; "~/workspace/training/symfony-hateoas-sandbox"

       "~/Java/spring-playgound"
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

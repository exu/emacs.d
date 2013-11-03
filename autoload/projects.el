(require 'projectile)
(projectile-global-mode 1)
(setq projectile-enable-caching t)
(setq projectile-tags-command "~/bin/php_etags")


(setq projects
      (list
       "~/.emacs.d"
       "~/.emacs.d/snippets/"
       "~/.emacs.d/autoload/"
       "~/.emacs.d/config/"
       "~/.emacs.d/vendor/"
       "~/www/github/behat-em"
       "~/www/crm"
       "~/www/deployer"
       "~/www/emailparser.web"
       "~/www/websites"
       "~/www/exu.github.com"
       "~/www/github/php-mode"
       "~/www/jobeet"
       "~/www/jqgrid"
       "~/www/kasia-gotuje"
       "~/www/mssql"
       "~/www/poligon"
       "~/www/poligon/go/koans"
       "~/www/qar.sn"
       ;; "~/www/rachciach"
       "~/www/tools"
       ;; "~/www/training/foodr"
       ;; "~/www/training/hal"
       "~/www/training/lisp-koans"
       ;; "~/www/training/phpspec"
       ;; "~/www/training/rad"
       ;; "~/www/training/rest"
       ;; "~/www/training/symfony-hateoas-sandbox"
       "~/www/transactional-api"
       "~/www/access-api"
       "~/www/typo-domains-redirector"
       "~/www/mieszalnia"
       "~/www/firmarozalczyk"
       "~/www/php-recruitment"
       "~/www/github/angular-seed"
       "~/www/github/factory-girl-php"
       "~/www/github/angular-phonecat"
       "~/www/github/bundle-skeleton"
       "~/www/github/behat-sqlexecutor"
       "~/www/rest-context-extension"
       "~/www/architecture"
       "~/go/src/github.com/exu/jas-playground"
       "~/www/video-sync"
       "~/www/newlayout"
       "~/Dropbox/Firma/generator"
       )
      )

(defun cd-and-visit (directory)
  (interactive "DEnter directory name: ")
  (cd directory)
  (setq tags-table-list (list directory))
  (gpicker-visit-project directory)
  (message (concat "Switching to " directory) )
  )

(defun ido-switch-project ()
  (interactive)
  (setq project-directory (ido-completing-read "Switch to project: " projects))
  (cd-and-visit project-directory)
  )

(defun dired-in-project-directory ()
  (interactive)
  (setq project-directory (ido-completing-read "Open project directory: " projects))
  (dired project-directory)
  )

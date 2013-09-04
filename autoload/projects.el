(require 'projectile)
(projectile-global-mode 1)
(setq projectile-enable-caching t)
(setq projectile-tags-command "~/bin/php_etags")


(setq projects
      (list
       "~/.emacs.d"
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
       "~/www/github/bundle-skeleton"
       "~/go/src/github.com/exu/jas-playground"
       )
      )

(defun cd-and-visit (directory)
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

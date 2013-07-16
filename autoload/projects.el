(require 'projectile)
(projectile-global-mode 1)
(setq projectile-enable-caching t)

(setq projects
      (list
       "~/.emacs.d"
       "~/www/github/behat-em"
       "~/www/crm"
       "~/www/deployer"
       "~/www/emailparser.web"
       "~/www/exu.github.com"
       "~/www/github/php-mode"
       "~/www/jobeet"
       "~/www/jqgrid"
       "~/www/kasia-gotuje"
       "~/www/kasia-retro"
       "~/www/mssql"
       "~/www/poligon"
       "~/www/poligon/go/koans"
       "~/www/qar.sn"
       "~/www/rachciach"
       "~/www/tools"
       "~/www/training/foodr"
       "~/www/training/hal"
       "~/www/training/lisp-koans"
       "~/www/training/phpspec"
       "~/www/training/rad"
       "~/www/training/rest"
       "~/www/training/symfony-hateoas-sandbox"
       "~/www/transactional-api"
       "~/www/typo-domains-redirector"
       "~/www/mieszalnia"
       "~/www/firmarozalczyk"
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
  (setq project-directory (ido-completing-read "Dirtection: " projects))
  (cd-and-visit project-directory)
  )

(defun switch-project-emacs ()
  (interactive)
  (cd-and-visit "~/.emacs.d")
  )

(defun switch-project-deployer ()
  (interactive)
  (cd-and-visit "~/www/deployer")
  )

(defun switch-project-crm ()
  (interactive)
  (cd-and-visit "~/www/crm")
  )

(defun switch-project-qarsn ()
  (interactive)
  (cd-and-visit "~/www/qar.sn")
  )

(defun switch-project-kg ()
  (interactive)
  (cd-and-visit "~/www/kasia-gotuje")
  )

(defun switch-project-rk ()
  (interactive)
  (cd-and-visit "~/www/kasia-retro")
  )

(defun switch-project-jq ()
  (interactive)
  (cd-and-visit "~/www/jqgrid")
  )

(defun switch-project-poligon ()
  (interactive)
  (cd-and-visit "~/www/poligon")
  )


(defun switch-project-emailparser ()
  (interactive)
  (cd-and-visit "~/www/emailparser.web")
  )


(defun switch-project-rachciach ()
  (interactive)
  (cd-and-visit "~/www/rachciach")
  )

(defun switch-project-tools ()
  (interactive)
  (cd-and-visit "~/www/tools")
  )

(defun switch-project-jobeet ()
  (interactive)
  (cd-and-visit "~/www/jobeet")
  )

(defun switch-project-training ()
  (interactive)
  (cd-and-visit "~/www/training/phpspec")
  )

(defun switch-project-kreisel ()
  (interactive)
  (cd-and-visit "~/www/mssql")
  )

(defun switch-project-blog ()
  (interactive)
  (cd-and-visit "~/www/exu.github.com")
  )

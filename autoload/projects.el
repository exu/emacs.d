(require 'projectile)
(projectile-global-mode 1)
(setq projectile-enable-caching t)

(setq projects
      (list
       "~/.emacs.d"
       "~/Workspace/crm"
       "~/Workspace/deployer"
       "~/Workspace/emailparser.web"
       "~/Workspace/exu.github.com"
       "~/Workspace/jobeet"
       "~/Workspace/jqgrid"
       "~/Workspace/kasia-gotuje"
       "~/Workspace/kasia-retro"
       "~/Workspace/mssql"
       "~/Workspace/poligon"
       "~/Workspace/qar.sn"
       "~/Workspace/rachciach"
       "~/Workspace/tools"
       "~/Workspace/training/hal"
       "~/Workspace/training/phpspec"
       "~/Workspace/training/rad"
       "~/Workspace/training/rest"
       "~/Workspace/training/symfony-hateoas-sandbox"
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
  (cd-and-visit "~/Workspace/deployer")
  )

(defun switch-project-crm ()
  (interactive)
  (cd-and-visit "~/Workspace/crm")
  )

(defun switch-project-qarsn ()
  (interactive)
  (cd-and-visit "~/Workspace/qar.sn")
  )

(defun switch-project-kg ()
  (interactive)
  (cd-and-visit "~/Workspace/kasia-gotuje")
  )

(defun switch-project-rk ()
  (interactive)
  (cd-and-visit "~/Workspace/kasia-retro")
  )

(defun switch-project-jq ()
  (interactive)
  (cd-and-visit "~/Workspace/jqgrid")
  )

(defun switch-project-poligon ()
  (interactive)
  (cd-and-visit "~/Workspace/poligon")
  )


(defun switch-project-emailparser ()
  (interactive)
  (cd-and-visit "~/Workspace/emailparser.web")
  )


(defun switch-project-rachciach ()
  (interactive)
  (cd-and-visit "~/Workspace/rachciach")
  )

(defun switch-project-tools ()
  (interactive)
  (cd-and-visit "~/Workspace/tools")
  )

(defun switch-project-jobeet ()
  (interactive)
  (cd-and-visit "~/Workspace/jobeet")
  )

(defun switch-project-training ()
  (interactive)
  (cd-and-visit "~/Workspace/training/phpspec")
  )

(defun switch-project-kreisel ()
  (interactive)
  (cd-and-visit "~/Workspace/mssql")
  )

(defun switch-project-blog ()
  (interactive)
  (cd-and-visit "~/Workspace/exu.github.com")
  )

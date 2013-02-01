(defun cd-and-visit (directory)
  (cd directory)
  (gpicker-visit-project directory)
  (message (concat "Switching to " directory) )
  )

(defun switch-project-deployer ()
  (interactive)
  (cd-and-visit "~/Workspace/deployer")
  )

(defun switch-project-crm ()
  (interactive)
  (cd-and-visit "~/Workspace/crm")
  )

(defun switch-project-kg ()
  (interactive)
  (cd-and-visit "~/Workspace/kasia-gotuje")
  )

(defun switch-project-rk ()
  (interactive)
  (cd-and-visit "~/Workspace/kasia-retro")
  )


(defun switch-project-poligon ()
  (interactive)
  (cd-and-visit "~/Workspace/poligon")
  )

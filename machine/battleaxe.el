;;; (gpicker-visit-project "~/Workspace/sf2/tnowak")
(gpicker-visit-project "~/Workspace/kasia-retro")



(global-set-key (kbd "<C-f10>") ( lambda ()
                                  (interactive)
                                  (wg-load "~/.emacs.d/workgroups/battleaxe-config.el")
                                  ))


(global-set-key (kbd "<C-S-f10>") ( lambda ()
                                    (interactive)
                                    (db-crm-work)
                                    (sql-set-sqli-buffer-generally)
                                    ))
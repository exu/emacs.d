;;; (gpicker-visit-project "~/www/sf2/tnowak")
(cd-and-visit "~/www/kasia-gotuje")



(global-set-key (kbd "<C-f10>") ( lambda ()
                                  (interactive)
                                  (wg-load "~/.emacs.d/workgroups/twohandaxe-config.el")
                                  ))


(global-set-key (kbd "<C-S-f10>") ( lambda ()
                                    (interactive)
                                    (db-crm-work)
                                    (sql-set-sqli-buffer-generally)
                                    ))

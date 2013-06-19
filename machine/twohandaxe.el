;;; (gpicker-visit-project "~/www/sf2/tnowak")
(gpicker-visit-project "~/www/kasia-gotuje.pl")



(global-set-key (kbd "<C-f10>") ( lambda ()
                                  (interactive)
                                  (wg-load "~/.emacs.d/workgroups/twohandaxe-config.el")
                                  ))


(global-set-key (kbd "<C-S-f10>") ( lambda ()
                                    (interactive)
                                    (db-crm-work)
                                    (sql-set-sqli-buffer-generally)
                                    ))

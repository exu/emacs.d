(cd-and-visit "~/www/kasia.in")
;; (cd-and-visit "~/www/firmarozalczyk")

(global-set-key (kbd "<C-f10>") ( lambda ()
                                  (interactive)
                                  (wg-load "~/.emacs.d/workgroups/battleaxe-config.el")
                                  ))

(global-set-key (kbd "<C-S-f10>") ( lambda ()
                                    (interactive)
                                    (db-crm-work)
                                    (sql-set-sqli-buffer-generally)
                                    ))

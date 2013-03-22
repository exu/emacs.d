(gpicker-visit-project "~/Workspace/crm")
;; workgroup load default

(global-set-key (kbd "<C-f10>") ( lambda ()
                               (interactive)
                               (wg-load "~/.emacs.d/workgroups/scimitar-config.el")
                               ))


(global-set-key (kbd "<C-S-f10>") ( lambda ()
                                  (interactive)
                                  (db-crm-work)
                                  (sql-set-sqli-buffer-generally)
                                  ))

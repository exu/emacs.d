;; recent project
(switch-project-qarsn)

(global-set-key (kbd "<C-f10>") ( lambda ()
                               (interactive)
                               (wg-load "~/.emacs.d/workgroups/scimitar-config.el")
                               ))


(global-set-key (kbd "<C-S-f10>") ( lambda ()
                                  (interactive)
                                  (db-crm-work)
                                  (sql-set-sqli-buffer-generally)
                                  ))

(setq tags-table-list '("/home/exu/Workspace/crm"))

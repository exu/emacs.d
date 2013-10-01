;; recent project
(cd-and-visit "~/www/websites")

(global-set-key (kbd "<C-S-f10>") ( lambda ()
                                  (interactive)
                                  (db-crm-work)
                                  (sql-set-sqli-buffer-generally)
                                  ))

(setq tags-table-list '("/home/exu/www/websites"))

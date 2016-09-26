(gpicker-visit-project "/srv/www/crm")


(global-set-key (kbd "<C-f10>") ( lambda ()
                                  (interactive)
                                  (wg-load "~/.emacs.d/workgroups/twohandaxe-config.el")
                                  ))


(global-set-key (kbd "<C-S-f10>") ( lambda ()
                                    (interactive)
                                    (db-crm-work)
                                    (sql-set-sqli-buffer-generally)
                                    ))



(global-set-key (kbd "<f1>1") (lambda nil (interactive) (cd-and-visit "~/www/websites") (magit-status) ))
(global-set-key (kbd "<f1>2") (lambda nil (interactive) (cd-and-visit "~/www/crm") ))

(global-set-key (kbd "<f1>3") (lambda nil (interactive) (cd-and-visit "~/www/iq-api-client") ))
(global-set-key (kbd "<f1>4") (lambda nil (interactive) (cd-and-visit "~/www/crm-api-client") ))
(global-set-key (kbd "<f1>5") (lambda nil (interactive) (cd-and-visit "~/www/deployer") ))

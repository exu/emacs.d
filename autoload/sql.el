(setq sql-connection-alist
      '((crm-work
         (sql-product 'postgres)
         (sql-server "10.0.0.221")
         (sql-user "jacek.wysocki")
         (sql-password "")
         (sql-database "crm")
         (sql-port 5432))
        (crm-rc
         (sql-product 'postgres)
         (sql-server "10.0.0.222")
         (sql-user "jacek.wysocki")
         (sql-password "")
         (sql-database "crm")
         (sql-port 3307))))

(defun sql-connect-preset (name)
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"
  (eval `(let ,(cdr (assoc name sql-connection-alist))
    (flet ((sql-get-login (&rest what)))
      (sql-product-interactive sql-product)))))

(defun db-crm-work ()
  (interactive)
  (sql-connect-preset 'crm-work))
(defun db-crm-rc ()
  (interactive)
  (sql-connect-preset 'crm-rc))




(defun my-sql-mode-hook ()
  (define-key sql-mode-map (kbd "RET") 'newline-and-indent)
  (sql-set-product 'postgres)
  (sql-highlight-postgres-keywords))

(add-hook 'sql-mode-hook 'my-sql-mode-hook)

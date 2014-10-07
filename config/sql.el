(defun sql-connect-preset (name)
  "Connect to a predefined SQL connection listed in `sql-connection-alist'"
  (eval `(let ,(cdr (assoc name sql-connection-alist))
    (flet ((sql-get-login (&rest what)))
      (sql-product-interactive sql-product)))))

(setq sql-connection-alist
   (quote
    (
     ("nu"
      (sql-product
       (quote mysql))
      (sql-server "localhost")
      (sql-user "root")
      (sql-password "")
      (sql-database "nu")
      (sql-port 3370))
     ("nc"
      (sql-product
       (quote mysql))
      (sql-server "localhost")
      (sql-user "root")
      (sql-password "")
      (sql-database "nc")
      (sql-port 3370))
     ("meluser"
      (sql-product
       (quote mysql))
      (sql-server "localhost")
      (sql-user "root")
      (sql-password "")
      (sql-database "meluser")
      (sql-port 3366))
     ("melcontent"
      (sql-product
       (quote mysql))
      (sql-server "localhost")
      (sql-user "root")
      (sql-password "")
      (sql-database "melcontent")
      (sql-port 3366))
     ("newngmel-user"
      (sql-product
       (quote mysql))
      (sql-user "root")
      (sql-database "newngmel_user")
      (sql-server "localhost"))
     ("newngmel-content"
      (sql-product
       (quote mysql))
      (sql-user "root")
      (sql-database "newngmel_content")
      (sql-server "localhost"))
     )))

(setq databases (list "meluser" "melcontent" "newngmel-user" "newngmel-content" "nu" "nc"))

(defun use-db ()
  (interactive)
  (sql-connect-preset (ido-completing-read "Switch to project: " databases)))

(defun my-sql-save-history-hook ()
    (let ((lval 'sql-input-ring-file-name)
          (rval 'sql-product))
      (if (symbol-value rval)
          (let ((filename
                 (concat "~/.emacs.d/sql/"
                         (symbol-name (symbol-value rval))
                         "-history.sql")))
            (set (make-local-variable lval) filename))
        (error
         (format "SQL history will not be saved because %s is nil"
                 (symbol-name rval))))))

(add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)


;; (setq sql-mysql-options '("--protocol=TCP"))


;; (defun my-sql-mode-hook ()
;;   (define-key sql-mode-map (kbd "RET") 'newline-and-indent)
;;   (sql-set-product 'postgres)
;;   (setq sql-port 5432)
;;   (sql-highlight-postgres-keywords))
;; (add-hook 'sql-mode-hook 'my-sql-mode-hook)

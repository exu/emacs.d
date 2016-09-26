;; (eval-after-load "sql"
;;   '(load-library "sql-indent"))

(setq sql-connection-alist
      '(
        (perfuser
         (sql-product 'mysql)
         (sql-user "ngm3lpr0d")
         (sql-password "P3ars0n12")
         (sql-server "127.0.0.1")
         (sql-database "nmeluser")
         (sql-port 33060))

        (perfcontent
         (sql-product 'mysql)
         (sql-user "ngm3lpr0d")
         (sql-password "P3ars0n12")
         (sql-server "127.0.0.1")
         (sql-database "nmelcontent")
         (sql-port 33060))

        (meluser
         (sql-product 'mysql)
         (sql-user "root")
         (sql-password "root")
         (sql-server "0.0.0.0")
         (sql-database "meluser")
         (sql-port 3309))

        (melcontent
         (sql-product 'mysql)
         (sql-user "root")
         (sql-password "root")
         (sql-server "0.0.0.0")
         (sql-database "melcontent")
         (sql-port 3309))

        (kobrauser
         (sql-product 'mysql)
         (sql-user "root")
         (sql-password "")
         (sql-database "meluser")
         (sql-server "10.157.50.152"))

        (localuser
         (sql-product 'mysql)
         (sql-user "root")
         (sql-password "root")
         (sql-database "newngmel_user")
         (sql-server "localhost"))

        (localcontent
         (sql-product 'mysql)
         (sql-user "root")
         (sql-password "root")
         (sql-database "newngmel_content")
         (sql-server "localhost"))

        (orcauser
         (sql-product 'mysql)
         (sql-user "root")
         (sql-password "root")
         (sql-database "meluser")
         (sql-server "10.157.50.187"))

        (orcacontent
         (sql-product 'mysql)
         (sql-user "root")
         (sql-password "root")
         (sql-database "melcontent")
         (sql-server "10.157.50.187"))

        )
      )

(defun mysql-connect (product connection)
  ;; remember to set the sql-product, otherwise, it will fail for the first time
  ;; you call the function
  (setq sql-product product)
  (sql-connect connection))


(defun mysql-perfuser ()
  (interactive)
  (my-sql-connect 'mysql 'perfuser))

(defun mysql-perfcontent ()
  (interactive)
  (my-sql-connect 'mysql 'perfcontent))

(defun mysql-meluser ()
  (interactive)
  (my-sql-connect 'mysql 'meluser))

(defun mysql-melcontent ()
  (interactive)
  (my-sql-connect 'mysql 'melcontent))

(defun mysql-localuser ()
  (interactive)
  (my-sql-connect 'mysql 'localuser))

(defun mysql-localcontent ()
  (interactive)
  (my-sql-connect 'mysql 'localcontent))

(defun mysql-kobrauser ()
  (interactive)
  (my-sql-connect 'mysql 'kobrauser))

(defun mysql-orcauser ()
  (interactive)
  (my-sql-connect 'mysql 'orcauser))

(defun mysql-orcacontent ()
  (interactive)
  (my-sql-connect 'mysql 'orcacontent))

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


(defun my-sql-mode-hook ()
  (define-key sql-mode-map (kbd "RET") 'newline-and-indent)
  (sql-set-product 'mysql)
  )
(add-hook 'sql-mode-hook 'my-sql-mode-hook)

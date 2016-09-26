;;; Compiled snippets and support files for `sql-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'sql-mode
                     '(("s" "SELECT * FROM $1 WHERE $2;\n" "select" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/sql-mode/select" nil nil)
                       ("j" "JOIN $1 $2 ON ($2.$3 = $4)\n" "join" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/sql-mode/join" nil nil)
                       ("i" "INSERT INTO $1 ($2) VALUES ($3);" "insert" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/sql-mode/insert" nil nil)
                       ("d" "DESCRIBE $1;\n" "describe" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/sql-mode/describe" nil nil)
                       ("dbs" "SHOW databases FROM $1;\n" "show databases" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/sql-mode/dbs" nil nil)
                       ("c" "SELECT count(*) FROM $1;\n" "count" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/sql-mode/count" nil nil)))


;;; Do not edit! File generated at Thu Sep 22 07:19:53 2016

;(require 'pi-php-mode)
(require 'php-mode)

(eval-after-load 'flymake '(require 'flymake-cursor))

(setq php-executable "/usr/bin/php")
;; If flymake_phpcs isn't found correctly, specify the full path
;; (setq flymake-phpcs-command "~/.emacs.d/vendor/emacs-flymake-phpcs/bin/flymake_phpcs")

;; Customize the coding standard checked by phpcs
;; (setq flymake-phpcs-standard  "/usr/share/php/PHP/CodeSniffer/Standards/PSR")

;; Show the name of sniffs in warnings (eg show
;; "Generic.CodeAnalysis.VariableAnalysis.UnusedVariable" in an unused
;; variable warning)

(setq flymake-phpcs-command
      "~/.emacs.d/vendor/emacs-flymake-phpcs/bin/flymake_phpcs")

(setq flymake-phpcs-standard
      "/usr/share/php/PHP/CodeSniffer/Standards/PSR2")

(setq flymake-phpcs-show-rule nil)

(require 'flymake-phpcs)

;; (require 'geben)

(font-lock-add-keywords 'php-mode
                        '(
                          ("\\$" 0 'custom-variable-dollar t)
                          ("{\\$\\(\\sw+\\)}" 0 'custom-variable-face t)
                          ("\\s\"\\|\\s|" 0 'custom-string-delimiter-face t)
                          ("\\<[0-9]+" 0 'custom-number-face)
                          ("true|null|false" 0 'custom-number-face)
                          ))


(defface custom-variable-dollar
  '((t (:foreground "#ffffff")))
   "Custom face for PHP $ sign in string")

(defface custom-variable-face
  '((t (:foreground "#e2b1f4")))
   "Custom face for PHP variables in string")

(defface custom-string-delimiter-face
  '((t (:foreground "#9a9a9a" :weight bold)))
   "Custom face for string delimiters")

(defface custom-number-face
  '((t (:foreground "#ff5555")))
   "Custom face for numbers")


(defun php-symfony2-toggle-test-src ()
  (interactive)
  (setf file-path (buffer-file-name))
  (message file-path)
  (find-file
   (if (string-match-p (regexp-quote "Test.php") file-path)
       (progn
         (message "Switching to Source")
         (setf file (mapconcat 'identity (split-string file-path "/Tests") ""))
         (replace-regexp-in-string "Test\\.php$" ".php" file)
         )
     (progn
       (message "Switching to Test")

       (setf case-fold-search-value case-fold-search)
       (setq case-fold-search nil)

       (if (string-match-p (regexp-quote "Bundle\/") file-path)
           (setf path-explode-regexp "Bundle\/")
         (setf path-explode-regexp "Extension\/"))

       (setf file-tmp (mapconcat 'identity (split-string file-path path-explode-regexp) (concat (match-string 0 file-path) "Tests/") ))
       (setq case-fold-search case-fold-search-value)
       (setf file (concat (file-name-sans-extension file-tmp) "Test.php")))
     )))

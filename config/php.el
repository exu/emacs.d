;(require 'pi-php-mode)
(require 'php-mode)

;; load Hack emacs extension if exists
(if (file-exists-p "/usr/share/hhvm/hack/emacs/hack-for-hiphop.el")
    (load "/usr/share/hhvm/hack/emacs/hack-for-hiphop.el"))


;; (require 'ob-php) WTF was that ?
(eval-after-load 'flymake '(require 'flymake-cursor))
(setq php-mode-coding-style 'symfony2)
(setq php-executable "/usr/bin/php")

(setq flymake-run-in-place nil) ;; I want my copies in the system temp dir.
(setq flymake-phpcs-command "~/.emacs.d/vendor/emacs-flymake-phpcs/bin/flymake_phpcs")
(setq flymake-phpcs-standard "/usr/share/php/PHP/CodeSniffer/Standards/PSR2")
(setq flymake-phpcs-show-rule nil)

(require 'flymake-phpcs)

;; (require 'geben)

(font-lock-add-keywords 'php-mode
                        '(
                          ;; ("\\s\"\\|\"\\s" 0 'custom-string-delimiter-face t)
                          ("\\$" 0 'custom-variable-dollar t)
                          ("{\\$\\(\\sw+\\)\\(\\[.*\\]\\)*}" 0 'custom-variable-in-string-face t)
                          ("'\\$\\(\\sw+\\)'" 0 'custom-variable-in-string-face t)
                          ("\\<[0-9]+" 0 'custom-number-face)
                          ("true|null|false" 0 'custom-number-face)
                          ))


(defface custom-variable-dollar
  '((t (:foreground "#ffffff")))
   "Custom face for PHP $ sign in string")

(defface custom-variable-in-string-face
  '((t (:foreground "#ebffdd")))
   "Custom face for PHP variables in string")

(defface custom-string-delimiter-face
  '((t (:foreground "#ff0000" :weight bold)))
   "Custom face for string delimiters")

(defface custom-number-face
  '((t (:foreground "#ff5555")))
   "Custom face for numbers")


(add-to-list 'flymake-allowed-file-name-masks
             '("spec/.*\\.php$"
               flymake-php-init
               flymake-simple-cleanup
               flymake-get-real-file-name))

(add-to-list 'flymake-allowed-file-name-masks
             '("wikia/.*\\.php$"
               flymake-php-init
               flymake-simple-cleanup
               flymake-get-real-file-name))

(add-to-list 'flymake-allowed-file-name-masks
             '("/tools/.*\\.php$"
               flymake-php-init
               flymake-simple-cleanup
               flymake-get-real-file-name))

;; (add-hook 'geben-session-enter-hook
;;           (lambda (session)
;;             (message "HOHOHOHOHO GEBEN hook")
;;             (message session)
;;             )
;;           )


;; (require 'php-doc)

;; Then bind it to whatever key you like
;;
;; (add-hook 'php-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "M-'") 'php-insert-doc-block)
;;             ))

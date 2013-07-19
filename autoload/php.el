;(require 'pi-php-mode)
(require 'php-mode)

(require 'ob-php)

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

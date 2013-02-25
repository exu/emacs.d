;(require 'pi-php-mode)
(require 'php-mode)

(setq php-executable "/usr/bin/php")
;; If flymake_phpcs isn't found correctly, specify the full path
;; (setq flymake-phpcs-command "~/.emacs.d/vendor/emacs-flymake-phpcs/bin/flymake_phpcs")

;; Customize the coding standard checked by phpcs
;; (setq flymake-phpcs-standard  "/usr/share/php/PHP/CodeSniffer/Standards/PSR")

;; Show the name of sniffs in warnings (eg show
;; "Generic.CodeAnalysis.VariableAnalysis.UnusedVariable" in an unused
;; variable warning)
(setq flymake-phpcs-show-rule t)
(require 'flymake-phpcs)

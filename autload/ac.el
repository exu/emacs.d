(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/autocomplete/dict")
(ac-config-default)

(setq ac-sources '(
                   ac-source-yasnippet
                   ac-source-abbrev
                   ac-source-dictionary
                   ac-source-words-in-same-mode-buffers
                   ac-source-variables
                   
                   ))

;; (defcustom ac-modes
;;   '(emacs-lisp-mode
;;     lisp-interaction-mode
;;     c-mode cc-mode c++-mode
;;     java-mode clojure-mode scala-mode
;;     scheme-mode
;;     ocaml-mode tuareg-mode
;;     perl-mode cperl-mode python-mode ruby-mode
;;     ecmascript-mode javascript-mode js-mode js2-mode js3-mode
;;     php-mode css-mode
;;     makefile-mode sh-mode
;;     fortran-mode f90-mode ada-mode
;;     xml-mode sgml-mode)
;; )

(auto-complete-mode 1)

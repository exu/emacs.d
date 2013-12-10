(require 'auto-complete)
;; https://github.com/nsf/gocode
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-user-dictionary-files "~/.emacs.d/ac-dictionary")

(defun symfony2-services ()
  (if (file-exists-p "app/console")
      (split-string (shell-command-to-string "app/console container:debug|cut -f1 -d' '") "\n")
    ))

(setq ac-sources '(
                   ac-source-yasnippet
                   ac-source-abbrev
                   ac-source-words-in-same-mode-buffers
                   ac-source-variables
                   ac-source-semantic
                   ac-source-dictionary
                   ;; ac-user-dictionary
                   ))

(add-hook 'php-mode (lambda () (add-to-list 'ac-sources 'ac-source-symfony2-services-in-get)))
(setq ac-auto-start 1)

(add-to-list 'ac-modes 'js3-mode)

(defvar ac-source-symfony2-services
  '((candidates . symfony2-services)
    (cache)))

(defvar ac-source-symfony2-services-in-get
  '((candidates . symfony2-services)
    (prefix . "->get(\\'\\(.*\\)")
    (cache)))

(defun php-symfony2-ac-services ()
  (interactive)
  (auto-complete '(ac-source-symfony2-services)))


(setq ac-auto-show-menu 0.1)


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
;;     xml-mode sgml-mode web-mode less-css-mode)
;; )

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode css-mode less-css-mode web-mode))
  (add-to-list 'ac-modes mode))




(auto-complete-mode 1)

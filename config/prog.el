(require 'auto-complete)
;; https://github.com/nsf/gocode
;; (require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
;; (add-to-list 'ac-user-dictionary-files "~/.emacs.d/ac-dictionary")
(setq ac-auto-start 1)
(setq ac-auto-show-menu 0.1)


(setq ac-sources '(
                   ;; ac-source-yasnippet
                   ac-source-abbrev
                   ac-source-words-in-same-mode-buffers
                   ac-source-variables
                   ac-source-semantic
                   ac-source-dictionary
                   ;; ac-user-dictionary
                   ))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode css-mode less-css-mode web-mode))
  (add-to-list 'ac-modes mode))


;; (add-to-list warning-suppress-types (yasnippet backquote-change))

(auto-complete-mode 1)


;; (require 'company)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (custom-set-variables
;;  '(company-idle-delay 0.1)
;;  )







;; (defun symfony2-services ()
;;   (if (file-exists-p "app/console")
;;       (split-string (shell-command-to-string "app/console container:debug|cut -f1 -d' '") "\n")
;;     ))

;; (add-hook 'php-mode (lambda () (add-to-list 'ac-sources 'ac-source-symfony2-services-in-get)))

;; (add-to-list 'ac-modes 'js3-mode)

;; (defvar ac-source-symfony2-services
;;   '((candidates . symfony2-services)
;;     (cache)))

;; (defvar ac-source-symfony2-services-in-get
;;   '((candidates . symfony2-services)
;;     (prefix . "->get(\\'\\(.*\\)")
;;     (cache)))

;; (defun php-symfony2-ac-services ()
;;   (interactive)
;;   (auto-complete '(ac-source-symfony2-services)))




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


(require 'whole-line-or-region)
(whole-line-or-region-mode 1)

(message "whole l or r") (get-time)

(require 'expand-region)
(global-set-key (kbd "C-#") 'er/expand-region)
(global-set-key (kbd "C-$") 'er/contract-region)


(require 'yasnippet)
(setq yas-snippet-dirs (list "~/.emacs.d/snippets")) ;removing default snippets I'm not using it
(yas-global-mode 1)


(require 'ido)
(ido-mode t)
(message "ido") (get-time)

(require 'puppet-mode)
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(message "puppet") (get-time)

(require 'grizzl)
(require 'fiplr)

(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.jpg" "*.png" "*.zip" "*~" "build/"))))

(global-set-key (kbd "C-x f") 'fiplr-find-file)


(require 'gpicker)
(message "gpicker") (get-time)

(require 'gist)
(setq gist-use-curl nil)

(message "gist") (get-time)

(require 'multiple-cursors)
(global-set-key (kbd "s-SPC") 'set-rectangular-region-anchor)

(message "mc") (get-time)

(require 'etags-select)

(message "etags") (get-time)
(setq tags-add-table t)

(require 'yaml-mode)

(message "yml") (get-time)

;; (require 'rainbow-mode)

(add-to-list 'auto-mode-alist '("log$" . apache-log-generic-mode))
(add-to-list 'auto-mode-alist '("/etc/apache.*\\.conf$" . apache-conf-generic-mode))

(add-to-list 'auto-mode-alist '(".yml.dist$" . yaml-mode))

;; (message "rainbow") (get-time)

;; (require 'request)

;; (message "req") (get-time)

;; (require 'htmlize)

;; (message "htmlize") (get-time)

;; (require 'dart-mode)
;; (message "dart-mode") (get-time)

;; (require 'helm-config)
;; (require 'helm-tags)
;; (message "helm") (get-time)

(require 'graphviz-dot-mode)
(setq graphviz-dot-view-command "xdot %s")

;; (require 'sws-mode)
;; (require 'jade-mode)
;; (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;; (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; View large files
(require 'vlf-setup)

(require 'dockerfile-mode)
(setq dockerfile-use-sudo t)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))


(require 'ag)
(add-to-list 'ag-arguments "TAGS")
(add-to-list 'ag-arguments "--ignore")
(setq ag-highlight-search t)
(setq ag-reuse-window 't)
(setq ag-reuse-buffers 't)

(add-to-list 'auto-mode-alist '("fabfile" . python-mode))

;; (require 'haskell-mode)


(require 'whitespace)
(setq whitespace-line-column 120)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)



(setq feature-default-language "en")
;; ;; point to cucumber languages.yml or gherkin i18n.yml to use
;; ;; exactly the same localization your cucumber uses
;; ;(setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
;; ;; and load feature-mode
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))



(add-to-list 'load-path "~/.emacs.d/vendor/magit/lisp")
(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/vendor/magit/Documentation/"))

(message "feature-mode") (get-time)
(require 'magit)
(message "magit") (get-time)

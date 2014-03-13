(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("Gruntfile" . js2-mode))
(add-to-list 'auto-mode-alist '(".jshintrc" . json-mode))

(require 'flymake-easy)
(require 'flymake-jshint)

(setq jshint-configuration-path "~/Dropbox/Dotfiles/jshint.json")

(add-hook 'js2-mode-hook 'flymake-jshint-load)

;; jshint handle that
(setq js2-mode-show-strict-warnings nil)

;; (add-to-list 'load-path "~/.emacs.d/vendor/tern/emacs/")
;; (autoload 'tern-mode "tern.el" nil t)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;; (eval-after-load 'tern
;;    '(progn
;;       (require 'tern-auto-complete)
;;       (tern-ac-setup)))


(require 'coffee-mode)
(setq coffee-args-compile '("-c" "-m")) ;; generating sourcemap
(add-hook 'coffee-after-compile-hook 'sourcemap-goto-corresponding-point)


(require 'json-mode)

;; (require 'skewer-mode)
;; (require 'skewer-html)
;; (require 'skewer-css)

;; (add-hook 'js2-mode-hook 'skewer-mode)
;; (add-hook 'css-mode-hook 'skewer-css-mode)
;; (add-hook 'html-mode-hook 'skewer-html-mode)

;(require 'skewer-repl)

;; (require 'impatient-mode)

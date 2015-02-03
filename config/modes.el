(require 'dired-single)
;; (global-whitespace-mode)
(eval-after-load "dired-x"
  '(progn
     (define-key dired-mode-map (kbd "C-j") 'dired-jump)))


(require 'recentf)
(setq recentf-save-file (concat savefile-dir "/recentf-" system-name))
(add-to-list 'recentf-exclude "ido.hist")
(add-to-list 'recentf-exclude ".ido.last")


(add-to-list 'recentf-exclude "/bookmarks")
(add-to-list 'recentf-exclude "/TAGS")
(add-to-list 'recentf-exclude "org-clock-save.el")
(add-to-list 'recentf-exclude "/home/exu/org/.*")

(recentf-mode 1)       ; Save a list of recent files visited.
(load-file recentf-save-file) ;; this file didnt autoload

(message "recentf") (get-time)

(global-superword-mode 1)
(global-prettify-symbols-mode 1)
(electric-pair-mode -1) ; electric disable
(show-paren-mode 1)    ; Highlight matching parentheses when the point is on them.
(global-linum-mode -1)
(global-hl-line-mode -1)
(delete-selection-mode 1) ; emacs doesn't delete selected text
(whitespace-mode 1)
(winner-mode 1) ;winner-undo winner-redo for windows management
(menu-bar-mode 0)
(tool-bar-mode 0)
(flyspell-mode nil)
(scroll-bar-mode -1)
(abbrev-mode 1)
(auto-fill-mode nil)
(global-auto-revert-mode t)
(horizontal-scroll-bar-mode -1)

(message "settings") (get-time)

(require 'whole-line-or-region)
(whole-line-or-region-mode 1)

(message "whole l or r") (get-time)

(require 'expand-region)
(global-set-key (kbd "C-#") 'er/expand-region)
(global-set-key (kbd "C-$") 'er/contract-region)

(require 'misc)




(require 'package)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org-mode" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)

(put 'narrow-to-region 'disabled nil)


(require 'yasnippet)
(setq yas-snippet-dirs (list "~/.emacs.d/snippets")) ;removing default snippets I'm not using it
(yas-reload-all)
(setq yas-indent-line 'fixed)
(setq yas-prompt-functions '(yas-ido-prompt yas-no-prompt))
;; (message "yasnippet") (get-time)


(require 'switch-window)


(message "er misc pack switch win") (get-time)

;; (require 'cssh)
;; (cssh-define-global-bindings)

(require 'ido)
(ido-mode t)

(message "ido") (get-time)

(require 'puppet-mode)
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(message "puppet") (get-time)


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

(require 'rainbow-mode)

(add-to-list 'auto-mode-alist '("log$" . apache-log-generic-mode))
(add-to-list 'auto-mode-alist '("/etc/apache.*\\.conf$" . apache-conf-generic-mode))

(add-to-list 'auto-mode-alist '(".yml.dist$" . yaml-mode))

(message "rainbow") (get-time)

(require 'request)

(message "req") (get-time)

(require 'htmlize)

(message "htmlize") (get-time)

(require 'dart-mode)

(message "dart-mode") (get-time)

(require 'helm-config)
(require 'helm-tags)

(require 'graphviz-dot-mode)
(setq graphviz-dot-view-command "xdot %s")


;; View large files
(require 'vlf-setup)

(require 'dockerfile-mode)
(setq dockerfile-use-sudo t)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))


(require 'ag)
(add-to-list 'ag-arguments "TAGS")
(add-to-list 'ag-arguments "--ignore")


(add-to-list 'auto-mode-alist '("fabfile" . python-mode))

(require 'haskell-mode)

(require 'whitespace)
(setq whitespace-line-column 120)
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

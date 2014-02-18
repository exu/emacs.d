(message "=========================")

(require 'dired-single);; MODES
;; (global-whitespace-mode)

(message "dired-single") (get-time)

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

(electric-pair-mode nil)
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

(message "settings") (get-time)

(require 'whole-line-or-region)
(whole-line-or-region-mode 1)

(message "whole l or r") (get-time)

(require 'expand-region)
(global-set-key (kbd "C-#") 'er/expand-region)
(global-set-key (kbd "C-$") 'er/contract-region)

(require 'misc)

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org-mode" . "http://orgmode.org/elpa/") t)
(package-initialize)

(put 'narrow-to-region 'disabled nil)

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

(require 'yasnippet)
(setq yas-snippet-dirs (list "~/.emacs.d/snippets")) ; removed default snippets I'm not using it
(setq yas-indent-line 'fixed)
(yas-global-mode)
(setq yas-prompt-functions '(yas-ido-prompt yas-no-prompt))

(message "yasnippet") (get-time)

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

(require 'yaml-mode)

(message "yml") (get-time)

(require 'rainbow-mode)

(add-to-list 'auto-mode-alist '("log$" . apache-log-generic-mode))
(add-to-list 'auto-mode-alist '(".yml.dist$" . yaml-mode))

(message "rainbow") (get-time)

(require 'request)

(message "req") (get-time)

(require 'htmlize)

(message "htmlize") (get-time)

(require 'dart-mode)

(message "dart-mode") (get-time)

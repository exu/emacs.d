;; MODES
(require 'dired-single)

(require 'recentf)
(setq recentf-save-file (concat savefile-dir "/recentf-" system-name))
(add-to-list 'recentf-exclude "ido.hist")
(add-to-list 'recentf-exclude ".ido.last")
(add-to-list 'recentf-exclude "/bookmarks")
(add-to-list 'recentf-exclude "/TAGS")
(add-to-list 'recentf-exclude "org-clock-save.el")
(recentf-mode 1)       ; Save a list of recent files visited.
(load-file recentf-save-file) ;; this file didnt autoload

(show-paren-mode 1)    ; Highlight matching parentheses when the point is on them.
;; (ido-mode t) ;; some errors in 24.3 with my conifguration
(global-linum-mode -1)
(global-hl-line-mode -1)
(delete-selection-mode 1) ; emacs doesn't delete selected text
;;(global-smart-tab-mode 1) ; does'nt work well
(whitespace-mode 1)
(winner-mode 1) ;winner-undo winner-redo for windows management
(menu-bar-mode 1)
(tool-bar-mode 0)
(flyspell-mode nil)
;(ruby-block-mode nil)
(scroll-bar-mode -1)
(abbrev-mode 1)
(auto-fill-mode nil)
(electric-pair-mode -1)
(add-to-list 'load-path
              "~/.emacs.d/elpa/yasnippet-20121216.1436")

(require 'whole-line-or-region)
(whole-line-or-region-mode 1)

(require 'yasnippet)
(setq yas-snippet-dirs (list "~/.emacs.d/snippets"))
                                        ; removed default snippets I'm not using it
(setq yas-indent-line 'fixed)
(yas-global-mode)
(setq yas-prompt-functions '(yas-ido-prompt yas-no-prompt))

(require 'expand-region)
(global-set-key (kbd "C-#") 'er/expand-region)
(global-set-key (kbd "C-$") 'er/contract-region)

(require 'gpicker)
(require 'org-generic "org-export-generic")

(require 'gist)
(setq gist-use-curl nil)

(require 'zencoding-mode)

(require 'multiple-cursors)
(global-set-key (kbd "s-SPC") 'set-rectangular-region-anchor)

(require 'etags-select)

(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(require 'misc)


(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org-mode" . "http://orgmode.org/elpa/") t)
(package-initialize)

(put 'narrow-to-region 'disabled nil)

(require 'switch-window)

(require 'cssh)
(cssh-define-global-bindings)

(require 'yaml-mode)

(require 'less-css-mode)
(setq less-css-output-directory "../css")

(require 'rainbow-mode)

;; (require 'helm-config)
;; (global-set-key (kbd "C-c h") 'helm-mini)
;; (global-set-key (kbd "C-\'") 'helm-mini)

(require 'ido)
(ido-mode t)

(require 'google-translate)
(setq google-translate-default-source-language "Polish")
(setq google-translate-default-target-language "English")

(require 'puppet-mode)
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

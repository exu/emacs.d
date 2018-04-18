(require 'dired-single)
;; (global-whitespace-mode)
(eval-after-load "dired-x"
  '(progn
     (define-key dired-mode-map (kbd "C-j") 'dired-jump)))

(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'recentf)
(setq recentf-save-file (concat savefile-dir "/recentf-" system-name))
(add-to-list 'recentf-exclude "ido.hist")
(add-to-list 'recentf-exclude ".ido.last")
(add-to-list 'recentf-exclude "/bookmarks")
(add-to-list 'recentf-exclude "/TAGS")
(add-to-list 'recentf-exclude "org-clock-save.el")
(add-to-list 'recentf-exclude "/home/exu/org/.*")
(add-to-list 'recentf-exclude "/home/exu/.emacs.d/var/*")

(recentf-mode 1)       ; Save a list of recent files visited.
(load-file recentf-save-file) ;; this file didnt autoload
(run-at-time nil (* 4 60) 'recentf-save-list)
(message "recentf") (get-time)

(require 'misc)


(require 'package)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org-mode" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(put 'narrow-to-region 'disabled nil)

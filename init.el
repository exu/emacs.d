(package-initialize)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)

(load "~/.emacs.d/etc/functions.el")(get-time "functions.el")
(timed-load "~/.emacs.d/etc/packages.el")
(timed-load "~/.emacs.d/etc/setup.el")
(timed-load "~/.emacs.d/etc/keys.el")
(timed-load "~/.emacs.d/etc/projects.el")
(timed-load "~/.emacs.d/etc/hooks.el")
(timed-load "~/.emacs.d/etc/custom.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/var/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/var/backups/"))))
 '(package-selected-packages
   (quote
    (web-mode ensime exec-path-from-shell yaml-mode markdown-mode json-mode yasnippet magit expand-region multiple-cursors projectile fzf use-package flycheck company-php company-go aggressive-indent ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

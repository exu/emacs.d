;; create the autosave dir if necessary, since emacs won't.
;; (make-directory "~/.emacs.d/var/autosaves/" t)
;; (make-directory "~/.emacs.d/var/backups/" t)

;;; Machine based configs
(setq machine-based-file (concat dotfiles-dir "machine/" system-name ".el"))
(when (file-exists-p machine-based-file)
  (message (concat "Loading: " machine-based-file))
  (load machine-based-file)
  )

(add-hook 'after-init-hook (lambda () (setq debug-on-error nil)))


(mapc 'load (directory-files autload-dir 't "^[^#].*el$"))


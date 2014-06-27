;;; Machine based configs
(setq machine-based-file (concat dotfiles-dir "machine/" system-name ".el"))
(when (file-exists-p machine-based-file)
  (message (concat "Loading: " machine-based-file))
  (load machine-based-file)
  )

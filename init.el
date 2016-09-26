;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq emacs-dir "~/.emacs.d")

(load (concat emacs-dir "/config/base.el"))
(load (concat emacs-dir "/config/functions.el"))
(load (concat emacs-dir "/config/autoload.el"))

(load (concat emacs-dir "/config/modes.el"))

(load (concat emacs-dir "/config/text.el"))
(load (concat emacs-dir "/config/projects.el"))
(load (concat emacs-dir "/config/hooks.el"))
(load (concat emacs-dir "/config/machine.el"))
(load (concat emacs-dir "/config/custom.el"))
(load (concat emacs-dir "/config/keys.el"))

(add-to-list 'custom-theme-load-path themes-dir)
(load-theme 'exu t)

(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")
;; (set-frame-font "-unknown-Anonymous Pro-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")

(setq fringe-mode (cons 1 0))
(setq echo-keystrokes 0.1)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-message t) ;; No emacs startup message
(setq transient-mark-mode t) ;; selecting text between markers
(setq color-theme-is-global t)

(setq fancy-splash-image "/home/exu/.emacs.d/start.jpg")
;; fancy-startup-text
;; fancy-about-text

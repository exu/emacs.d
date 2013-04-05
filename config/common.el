;; Variables
(setq create-lockfiles nil)
(setq mouse-yank-at-point t)
(setq require-final-newline nil)
(setq truncate-partial-width-windows nil)
(setq eshidiff-window-setup-function 'ediff-setup-windows-plain)
(setq save-place-file (concat savefile-dir "places"))
(setq scroll-margin 0)
(setq scroll-conservatively 0)
(setq scroll-preserve-screen-position 1)
(setq default-directory "~/Workspace")
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq dired-listing-switches "-lXGh --group-directories-first")

 ;; IDO mode
(setq ido-enable-prefix nil)
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq ido-use-filename-at-point 'guess)
(setq ido-max-prospects 10)

(setq default-truncate-lines t) ;; disable line wrap
(setq truncate-partial-width-windows nil) ;; make side by side buffers function the same as the main window
(setq longlines-auto-wrap nil)

(setq initial-major-mode 'text-mode) ; change scratch buffer to text-mode
(setq initial-scratch-message "")    ; change scratch buffer message
(setq linum-format "%4d ")           ; number format in line number

(setq abbrev-file-name "~/.emacs.d/config/abbrevs.el")
(setq default-abbrev-mode t)

(setq mouse-wheel-scroll-amount '(3))
(setq mouse-wheel-progressive-speed nil)

(setq set-mark-command-repeat-pop 1) ; jump back to marker by C-u C-SPC C-SPC

;;;; no shell EMACS
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

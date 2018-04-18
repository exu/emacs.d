
(setq ct (current-time))
(setq st (current-time))
(defun get-time ()
  (message (concat
            "Lib: "
            (number-to-string (float-time
                               (time-subtract (current-time) ct)))
            ", from start: "
            (number-to-string (float-time
                               (time-subtract (current-time) st)))
            ))
  (setq ct (current-time))
  )

(fset 'yes-or-no-p 'y-or-n-p)
(setq user-mail-address "jacek.wysocki@pearson.com")
(setq user-full-name "Jacek Wysocki")
(setq large-file-warning-threshold 30000000)

;; Paths
(defvar root-dir "~/.emacs.d/")
(defvar dotfiles-dir root-dir)
(defvar vendor-dir (expand-file-name "vendor" root-dir))
(defvar config-dir (expand-file-name "config" root-dir))
(defvar themes-dir (expand-file-name "themes" root-dir))
(defvar savefile-dir (expand-file-name "var" root-dir))
(defvar elpa-dir (expand-file-name "elpa" root-dir))
(defvar snippets-dir (expand-file-name "snippets" root-dir))

(setenv "GOPATH" "/home/exu/Appz/go/bin")
(setq exec-path (append exec-path (list (expand-file-name "/home/exu/Appz/go/bin"))))

(defun add-subfolders-to-load-path (parent-dir)
  "Adds all first level `parent-dir' subdirs to the Emacs load path."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(setq custom-file (expand-file-name "custom.el" config-dir))

(add-to-list 'load-path themes-dir)
(add-to-list 'load-path vendor-dir)
(add-subfolders-to-load-path vendor-dir)

(require 'dash)

(add-subfolders-to-load-path elpa-dir)

(setq bookmark-default-file (concat dotfiles-dir "bookmarks/bookmarks-" system-name ".el"))
(setq bookmark-save-flag 1)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/var/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/var/backups/"))))




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
(setq default-directory "~/src")
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq tramp-default-method "sshx")
(setq dired-listing-switches "-al --group-directories-first")

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

;; (setq abbrev-file-name "~/.emacs.d/config/abbrevs.el")
;; (setq default-abbrev-mode t)

(setq mouse-wheel-scroll-amount '(3))
(setq mouse-wheel-progressive-speed nil)

(setq set-mark-command-repeat-pop 1) ; jump back to marker by C-u C-SPC C-SPC
(setq visible-bell t)

(setq hi-lock-face-defaults '("hi-yellow" "hi-pink" "hi-green" "hi-blue" "hi-black-b" "hi-blue-b" "hi-red-b" "hi-green-b"))


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
;; (horizontal-scroll-bar-mode -1)

(message "settings") (get-time)


;; Terminal settings
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)
(setq  xterm-mouse-mode t)

;; Indenting
(set-fill-column 120)
(setq fill-column 120)
(setq whitespace-line-column 120)
(setq whitespace-style (quote (face trailing tabs newline tab-mark newline-mark)))
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space, ·
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [172 10]) ; newlne, ¶¬
   (tab-mark 9 [9655 9] [92 9]) ; tab, ▷ 9655
   ))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default yaml-indent-offset 4)
(setq-default js-indent-level 4)
(setq-default js2-basic-offset 4)



;;;; no shell EMACS
(when window-system
  (setq frame-title-format '("" "%f @ Emacs " emacs-version))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))




;; Run emacs server
(require 'server)
(unless (server-running-p) (server-mode t))


;; UI
(add-to-list 'custom-theme-load-path themes-dir)
(load-theme 'exu t)

;;(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

(setq fringe-mode (cons 1 0))
(setq echo-keystrokes 0.1)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-message t) ;; No emacs startup message
(setq transient-mark-mode t) ;; selecting text between markers
(setq color-theme-is-global t)

;; (setq fancy-splash-image "/home/exu/.emacs.d/start.jpg")
;; fancy-startup-text
;; fancy-about-text

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-beta")

(message "Base loaded; ") (get-time)

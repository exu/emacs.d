;; PATHS
(defvar root-dir "~/.emacs.d/")
(defvar dotfiles-dir root-dir)
(defvar config-dir (expand-file-name "etc" root-dir))
(defvar themes-dir (expand-file-name "themes" root-dir))
(defvar savefile-dir (expand-file-name "var" root-dir))
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

;(add-subfolders-to-load-path vendor-dir)
;(add-subfolders-to-load-path elpa-dir)

(setq bookmark-default-file (concat dotfiles-dir "bookmarks/bookmarks-" system-name ".el"))
(setq bookmark-save-flag 1)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/var/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/var/backups/"))))

(fset 'yes-or-no-p 'y-or-n-p)

(setq create-lockfiles nil)
(setq mouse-yank-at-point t)
(setq require-final-newline nil)

(setq scroll-margin 0)
(setq scroll-conservatively 0)
(setq scroll-preserve-screen-position 1)

(setq default-directory "~/src")
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq tramp-default-method "sshx")
(setq dired-listing-switches "-al --group-directories-first")


(setq default-truncate-lines t) ;; disable line wrap

(setq initial-major-mode 'text-mode) ; change scratch buffer to text-mode
(setq initial-scratch-message "")    ; change scratch buffer message
(setq linum-format "%4d ")           ; number format in line number

(setq abbrev-file-name "~/.emacs.d/etc/abbrevs.el")
(setq default-abbrev-mode t)

(setq mouse-wheel-scroll-amount '(3))
(setq mouse-wheel-progressive-speed nil)

;; (setq visible-bell t)

(setq hi-lock-face-defaults '("hi-yellow" "hi-pink" "hi-green" "hi-blue" "hi-black-b" "hi-blue-b" "hi-red-b" "hi-green-b"))


(recentf-mode 1)
(setq recentf-max-menu-items 1000)


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'exu t)

;(set-frame-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")

(setq fringe-mode (cons 1 0))
(setq echo-keystrokes 0.1)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-message t) ;; No emacs startup message
(setq transient-mark-mode t) ;; selecting text between markers
(setq color-theme-is-global t)


(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(delete-selection-mode 1)

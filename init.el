(defvar root-dir (file-name-directory load-file-name))

(defun add-subfolders-to-load-path (parent-dir)
  "Adds all first level `parent-dir' subdirs to the Emacs load path."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))


(defvar root-dir (file-name-directory load-file-name))
(defvar autload-dir (expand-file-name "autoload" root-dir))
(defvar vendor-dir (expand-file-name "vendor" root-dir))
(defvar themes-dir (expand-file-name "themes" root-dir))
(defvar savefile-dir (expand-file-name "var" root-dir))
(defvar elpa-dir (expand-file-name "elpa" root-dir))
(defvar snippets-dir (expand-file-name "snippets" root-dir))
(defvar dotfiles-dir "~/.emacs.d/")

(setq custom-file (expand-file-name "custom.el" autload-dir))

;; (add-to-list 'load-path modules-dir)
(add-to-list 'load-path themes-dir)
(add-to-list 'load-path vendor-dir)

(add-subfolders-to-load-path vendor-dir)
(add-subfolders-to-load-path elpa-dir)

(require 'dash)

(add-to-list 'custom-theme-load-path themes-dir)
(load-theme 'zenburn t)

(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")

(fset 'yes-or-no-p 'y-or-n-p)

;; Terminal settings
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)
(setq  xterm-mouse-mode t)

;; Variables
(setq
 fringe-mode (cons 2 0)
 echo-keystrokes 0.1
 font-lock-maximum-decoration t
 inhibit-startup-message t ;; No emacs startup message
 transient-mark-mode t ;; selecting text between markers
 color-theme-is-global t
 mouse-yank-at-point t
 require-final-newline nil
 truncate-partial-width-windows nil
 eshidiff-window-setup-function 'ediff-setup-windows-plain
 save-place-file (concat savefile-dir "places")
 scroll-margin 0
 scroll-conservatively 0
 scroll-preserve-screen-position 1
 default-directory "~/Workspace"
 tags-table-list '("/home/exu/Workspace/crm")

 make-backup-files nil
 auto-save-default nil

 dired-listing-switches "-lXGh --group-directories-first"
 tramp-default-method "scpc"

 ;; IDO mode
 ido-enable-prefix nil
 ido-enable-flex-matching t
 ido-create-new-buffer 'always
 ido-use-filename-at-point 'guess
 ido-max-prospects 10

 default-truncate-lines t ;; disable line wrap
 truncate-partial-width-windows nil ;; make side by side buffers function the same as the main window
 longlines-auto-wrap nil

 initial-major-mode 'text-mode ; change scratch buffer to text-mode
 initial-scratch-message ""    ; change scratch buffer message
 linum-format "%4d "           ; number format in line number
 
 abbrev-file-name "~/.emacs.d/config/abbrevs.el"
 default-abbrev-mode t

 mouse-wheel-scroll-amount '(3)
 mouse-wheel-progressive-speed nil

 set-mark-command-repeat-pop 1 ; jump back to marker by C-u C-SPC C-SPC
 )

;; Text formattig and indenting
(set-fill-column 120)

(setq
 fill-column 120
 whitespace-line-column 120
 whitespace-style (quote (trailing tabs newline tab-mark newline-mark))
 whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space, ·
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [172 10]) ; newlne, ¶¬
   (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
   )
 )

(setq-default
 indent-tabs-mode nil
 tab-width 2
 c-basic-offset 4
 yaml-indent-offset 4
 js-indent-level 4
 )

;;;; no shell EMACS
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))


;;;; Mode based hooks
(add-hook 'html-mode-hook
          (lambda ()
            (interactive)
            (set (make-local-variable 'sgml-basic-offset) 4)
            (setq fill-column 120)
            (linum-mode 1)
            ))

(add-hook 'sgml-mode-hook
          (lambda ()
            (interactive)
            (set (make-local-variable 'sgml-basic-offset) 4)
            (setq fill-column 120)
            (linum-mode 1)
            ))

(add-hook 'log-edit-mode-hook
          (lambda () (interactive)
            (local-set-key (kbd "RET") 'log-edit-done)
            ))


(add-hook 'php-mode-hook
          (lambda()
            (interactive)
            (flymake-mode 1)
            (flymake-phpcs-init)
            (linum-mode 1)
            ))

(add-hook 'c-mode-hook
          (lambda()
            (interactive)
            (setq indent-tabs-mode nil)
            (linum-mode 1)
            ))

(add-hook 'term-mode-hook
          (lambda()
            (interactive)
            (linum-mode -1)
            ))

(add-hook 'css-mode-hook
          (lambda () (interactive) (rainbow-mode 1)
            ))

(add-hook 'sgml-mode-hook 'zencoding-mode)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

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
(ido-mode t)
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
(yas-global-mode)
(yas/load-directory "~/.emacs.d/snippets")

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


(setq bookmark-default-file (concat dotfiles-dir "bookmarks/bookmarks-" system-name ".el"))
(setq bookmark-save-flag 1)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/var/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/var/backups/"))))

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

(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(put 'narrow-to-region 'disabled nil)

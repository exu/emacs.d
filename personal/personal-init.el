(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")

(fset 'yes-or-no-p 'y-or-n-p)

;;(disable-theme 'zenburn)
;;(enable-theme 'monokai)
;;(load-theme 'solarized-dark t)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

;; Variables
(setq fringe-mode (cons 4 0)
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline nil
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      ffap-machine-p-known 'reject

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


      eshidiff-window-setup-function 'ediff-setup-windows-plain
      oddmuse-directory (concat dotfiles-dir "oddmuse")
      xterm-mouse-mode t
      save-place-file (concat dotfiles-dir "places")
      scroll-margin 0
      scroll-conservatively 0
      scroll-pvreserve-screen-position 1
      default-directory "~/Workspace"

      tags-table-list '("/home/exu/Workspace/crm")

      make-backup-files nil
      auto-save-default nil

      shift-select-mode 1

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
      abbrev-file-name "~/.emacs.d/abbrevs"

      mouse-wheel-scroll-amount '(3)
      mouse-wheel-progressive-speed nil

      org-agenda-window-setup 'current-window
      compare-ignore-whitespace 1
      set-mark-command-repeat-pop 1 ; jump back to marker by C-u C-SPC C-SPC

      
      )

(set-fill-column 120) ; fill column didn't work

;; Indenting
(setq-default indent-tabs-mode nil
              tab-width 4
              )

(setq c-basic-offset 4
      yaml-indent-offset 4
      js-indent-level 4
      )



;;;; no shell EMACS

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1)
  (add-hook 'before-make-frame-hook 'turn-off-tool-bar))


;;;; HOOKS

(add-hook 'html-mode-hook
          (lambda ()
            (interactive)
            ;; Default indentation is usually 2 spaces, changing to 4.
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


(add-hook 'php-mode-hook (lambda()
                         (interactive)
                         (flymake-mode 1)
                         (linum-mode 1)
                         ))

(add-hook 'c-mode-hook (lambda()
                         (interactive)
                         (setq indent-tabs-mode nil)
                         (linum-mode 1)
                         ))

(add-hook 'term-mode-hook (lambda()
                         (interactive)
                         (linum-mode -1)
                         (message "Hello from hook")
                         ))

(add-hook 'css-mode-hook (lambda () (interactive) (rainbow-mode 1)))

(add-hook 'sgml-mode-hook 'zencoding-mode)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; MODES
(require 'dired-single)

;;; per system savedir for recentf

(require 'recentf)
(setq recentf-save-file (concat savefile-dir "recentf-" system-name))
(add-to-list 'recentf-exclude "ido.hist")
(add-to-list 'recentf-exclude ".ido.last")
(add-to-list 'recentf-exclude "/bookmarks")
(add-to-list 'recentf-exclude "/TAGS")
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


(setq bookmark-default-file (concat dotfiles-dir "bookmarks/bookmarks-" system-name ".el"))
(setq bookmark-save-flag 1)

;;; Machine based configs
(setq machine-based-file (concat dotfiles-dir "machine/" system-name ".el"))
(when (file-exists-p machine-based-file)
  (message (concat "Loading: " machine-based-file))
  (load machine-based-file)
  )

(add-hook 'after-init-hook (lambda () (setq debug-on-error nil)))

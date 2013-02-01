(setq dotfiles-dir "~/.emacs.d/")
(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")

(fset 'yes-or-no-p 'y-or-n-p)

;;; KEYS
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x ^") 'join-line)
(global-set-key (kbd "C-x p") 'proced)
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))
(global-set-key (kbd "C-x M-m") 'shell)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))
(global-set-key "\C-m"          'newline-and-indent)


(global-set-key (kbd "<f2>") 'exu-f1-dirs-map) ;; dirs
(global-set-key (kbd "<f2>a") (lambda nil (interactive) (dired "/etc/apache2")))
(global-set-key (kbd "<f2>p") (lambda nil (interactive) (dired "/etc/postgresql/9.1/main")))
(global-set-key (kbd "<f2>e") (lambda nil (interactive) (dired "/etc/")))
(global-set-key (kbd "<f2>w") (lambda nil (interactive) (dired "/srv/www/")))
(global-set-key (kbd "<f2>c") (lambda nil (interactive) (dired "/srv/www/crm")))
(global-set-key (kbd "<f2>q") (lambda nil (interactive) (dired "/srv/www/qarson")))


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
      xterm-mouse-mode t
      save-place-file (concat dotfiles-dir "places")
      scroll-margin 0
      scroll-conservatively 0
      scroll-pvreserve-screen-position 1
      default-directory "~"

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



(show-paren-mode 1)    ; Highlight matching parentheses when the point is on them.
(ido-mode t)
(global-linum-mode -1)
(global-hl-line-mode -1)
(delete-selection-mode 1) ; emacs doesn't delete selected text
;;(global-smart-tab-mode 1) ; does'nt work well
(add-hook 'after-init-hook (lambda () (setq debug-on-error nil)))

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
(global-set-key "\C-m" 'newline-and-indent)


(define-prefix-command 'exu-f1-dirs-map)
(global-set-key (kbd "<f2>") 'exu-f1-dirs-map) ;; dirs
(global-set-key (kbd "<f2>a") (lambda nil (interactive) (dired "/etc/apache2")))
(global-set-key (kbd "<f2>p") (lambda nil (interactive) (dired "/etc/postgresql/9.1/main")))
(global-set-key (kbd "<f2>e") (lambda nil (interactive) (dired "/etc/")))
(global-set-key (kbd "<f2>w") (lambda nil (interactive) (dired "/srv/www/")))
(global-set-key (kbd "<f2>c") (lambda nil (interactive) (dired "/srv/www/crm")))
(global-set-key (kbd "<f2>q") (lambda nil (interactive) (dired "/srv/www/qarson")))

(setq create-lockfiles nil)
(setq mouse-yank-at-point t)
(setq require-final-newline nil)
(setq truncate-partial-width-windows nil)
(setq eshidiff-window-setup-function 'ediff-setup-windows-plain)
(setq scroll-margin 0)
(setq scroll-conservatively 0)
(setq scroll-preserve-screen-position 1)
(setq default-directory "/srv/www")
(setq make-backup-files nil)
(setq auto-save-default nil)

(setq tramp-default-method "sshx")

(setq dired-listing-switches "-al --group-directories-first")

(setq fringe-mode (cons 1 0))
(setq echo-keystrokes 0.1)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-message t) ;; No emacs startup message
(setq transient-mark-mode t) ;; selecting text between markers
(setq color-theme-is-global t)


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
(setq visible-bell t)

(setq hi-lock-face-defaults '("hi-yellow" "hi-pink" "hi-green" "hi-blue" "hi-black-b" "hi-blue-b" "hi-red-b" "hi-green-b"))

;;;; no shell EMACS
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

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
(setq js2-basic-offset 4)
(set-fill-column 120) ; fill column didn't work
(show-paren-mode 1)    ; Highlight matching parentheses when the point is on them.
(ido-mode t)
(global-linum-mode -1)
(global-hl-line-mode -1)
(delete-selection-mode 1) ; emacs doesn't delete selected text
;;(global-smart-tab-mode 1) ; does'nt work well



;;;; HOOKS
(add-hook 'html-mode-hook
          (lambda ()
            (interactive)
            (set (make-local-variable 'sgml-basic-offset) 4)
            (setq fill-column 120)
            (whitespace-mode 0)
            (linum-mode 1)))

(add-hook 'sgml-mode-hook
          (lambda ()
            (interactive)
            (set (make-local-variable 'sgml-basic-offset) 4)
            (setq fill-column 120)
            (linum-mode 1)))

(add-hook 'log-edit-mode-hook
          (lambda ()
            (interactive)
            (local-set-key (kbd "RET") 'log-edit-done)))


(add-hook 'php-mode-hook
          (lambda()
            (define-key php-mode-map '[(control .)] 'next-error)
            (whitespace-mode 1)
            (linum-mode 1)))

(add-hook 'ruby-mode-hook
          (lambda()
            (interactive)
            (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
            (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
            (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
            (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
            (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
            (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
            (whitespace-mode 1)
            (linum-mode 1)))

(add-hook 'js3-mode-hook
          (lambda()
            (whitespace-mode 1)
            (linum-mode 1)))

(add-hook 'js2-mode-hook
          (lambda()
            (whitespace-mode 1)
            (linum-mode 1)))

(add-hook 'js-mode-hook
          (lambda()
            (whitespace-mode 1)
            (linum-mode 1)))

(add-hook 'c-mode-hook
          (lambda()
            (interactive)
            (setq indent-tabs-mode nil)
            (whitespace-mode 1)
            (linum-mode 1)))

(add-hook 'term-mode-hook
          (lambda()
            (interactive)
            (whitespace-mode 1)
            (linum-mode 0)))

(add-hook 'css-mode-hook
          (lambda ()
            (interactive)
            (whitespace-mode 1)
            (rainbow-mode 1)
            (linum-mode 1)))

(add-hook 'sgml-mode-hook 'zencoding-mode)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'before-save-hook (lambda ()
                              (delete-trailing-whitespace)
                              (set-buffer-file-coding-system 'utf-8)
                              )
          )

(add-hook 'magit-log-edit-mode-hook
          (lambda ()
            (interactive)
            (flyspell-mode t)
            (setq flyspell-default-dictionary "en")
            (ispell-change-dictionary "en")))

(add-hook 'git-commit-mode-hook
          (lambda ()
            (interactive)
            (flyspell-mode t)
            (setq flyspell-default-dictionary "en")
            (ispell-change-dictionary "en")))


(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (whitespace-mode 1)
            (add-hook 'after-save-hook
                      (lambda ()
                        (if (file-exists-p (concat buffer-file-name "c"))
                            (progn
                              (delete-file (concat buffer-file-name "c"))
                              (byte-compile-file buffer-file-name))
                          ))
                      nil
                      t)))


(add-hook 'less-css-mode-hook
          (lambda ()
            (whitespace-mode 1)
            (add-hook 'after-save-hook
                      (lambda () (less-css-compile) (message "Compiling LESS to CSS"))
                      nil
                      t)))


(add-hook 'web-mode-hook
          (lambda ()
            (whitespace-mode -1)
            (linum-mode 1)
            ))

(add-hook 'feature-mode-hook
          (lambda ()
            (linum-mode 1)
            ))

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (linum-mode)
            (setq indent-tabs-mode 1)))



(defun exu-compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h 11)))))))

(add-hook 'compilation-mode-hook 'exu-compilation-hook)



;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(message "Your emacs is ready")

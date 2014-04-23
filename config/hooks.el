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

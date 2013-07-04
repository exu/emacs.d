(add-hook 'html-mode-hook
          (lambda ()
            (interactive)
            (set (make-local-variable 'sgml-basic-offset) 4)
            (setq fill-column 120)
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
            (interactive)
            ;; (flymake-mode 1)
            ;; (flymake-phpcs-init)
            (define-key php-mode-map '[(control .)] 'next-error)
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
            (linum-mode 1)))

(add-hook 'js3-mode-hook
          (lambda()
            (linum-mode 1)))

(add-hook 'js-mode-hook
          (lambda()
            (linum-mode 1)))

(add-hook 'c-mode-hook
          (lambda()
            (interactive)
            (setq indent-tabs-mode nil)
            (linum-mode 1)))

(add-hook 'term-mode-hook
          (lambda()
            (interactive)
            (linum-mode -1)))

(add-hook 'css-mode-hook
          (lambda ()
            (interactive)
            (rainbow-mode 1)))

(add-hook 'sgml-mode-hook 'zencoding-mode)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'magit-log-edit-mode-hook
          (lambda ()
            (interactive)
            (flyspell-mode t)
            (setq flyspell-default-dictionary "en")
            (ispell-change-dictionary "en")))



(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (add-hook 'after-save-hook
                      (lambda ()
                        (if (file-exists-p (concat buffer-file-name "c"))
                            (progn
                              (delete-file (concat buffer-file-name "c"))
                              (byte-compile-file buffer-file-name))
                          ))
                      nil
                      t)))

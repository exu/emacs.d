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
            ;; (flymake-mode 1)
            ;; (flymake-phpcs-init)
            (define-key php-mode-map '[(control .)] 'next-error)
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

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'magit-log-edit-mode-hook
          (lambda ()
            (interactive)
            (flyspell-mode t)
            (ispell-change-dictionary "en")))

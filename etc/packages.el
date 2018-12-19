(eval-when-compile
  (require 'use-package))

(require 'dired-x)

;; LIBS


(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)
    (setq company-tooltip-align-annotations t
          company-show-numbers t
          company-minimum-prefix-length 2
          company-idle-delay 0.1
	  company-dabbrev-downcase nil))
  :diminish company-mode)

(use-package company-go
  :config
  (add-hook 'go-mode-hook 'company-mode)
  (add-to-list 'company-backends 'company-go))


(use-package go-mode
  :ensure t
  :defer t
  :init
  (progn
    (linum-mode 1)
    (setq gofmt-command "goimports")
    (setq exec-path (append exec-path (list (expand-file-name "~/bin/"))))
    (setq exec-path (append exec-path (list (expand-file-name "/usr/local/go/bin/"))))
    (setq gofmt-command "goimports")
    (setq tab-width 4)
    (setq indent-tabs-mode 1)
    (bind-key [remap find-tag] #'godef-jump)
    (add-hook 'before-save-hook 'gofmt-before-save)
    (setenv "GOPATH" "/home/exu")
    (add-hook 'go-mode-hook
              (lambda ()
                (yas-minor-mode 1)
                (add-hook 'before-save-hook 'gofmt-before-save)
                (local-set-key (kbd "M-.") #'godef-jump)
                (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                (local-set-key (kbd "C-c i") 'go-goto-imports)
                (setq tab-width 4)
                (linum-mode)
                (setq indent-tabs-mode 1)))

    (exec-path-from-shell-copy-env "GOPATH")
    (setenv "GOPATH" "/home/exu")
    (add-hook 'before-save-hook 'gofmt-before-save)
    (bind-key (kbd "M-.") 'godef-jump)
    (bind-key (kbd "M-*") 'pop-tag-mark)
    (bind-key (kbd "C-c C-r") 'go-remove-unused-imports)
    (bind-key (kbd "C-c i") 'go-goto-imports)
    )


  :config
  (add-hook 'go-mode-hook 'electric-pair-mode))


(use-package ag
  :ensure t
  :commands (ag ag-regexp ag-project))

(use-package projectile
  :defer t
  :config (projectile-global-mode 1))

(use-package multiple-cursors-mode
  :defer t)

(use-package magit
  :defer t)

(use-package dockerfile-mode
  :defer t)
(use-package docker-compose-mode
  :defer t)


(use-package yasnippet
  :defer t
  :init
  (progn (yas-global-mode))
  )

(use-package markdown-mode
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode)
  :config)

(use-package yaml-mode
  :mode "\\.yaml\\'"
  :config (setq yaml-indent-offset 2))

(use-package fzf
  :defer t)

(use-package expand-region
  :commands er/expand-region
  :bind ("C-#" . er/expand-region)
  ("C-@" . er/contract-region))

(load-file "~/.emacs.d/vendor/etags-select.el")
(use-package etags-select)

(load-file "~/.emacs.d/vendor/whole-line-or-region.el")
(use-package whole-line-or-region
  :init (whole-line-or-region-global-mode 1))


(use-package web-mode
  :mode (("\\.html$" .  web-mode)
         ("\\.phtml$" .  web-mode)) )

(use-package tide
  :mode ("\\.ts$" . typescript-mode))

(use-package elixir-mode
  :defer t
  :config
  (add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t))))

(use-package alchemist
  ;; :mode ("\\.exs$" . web-mode)
  :defer t
  :bind (:map alchemist-mode-map
	 ("M-w" . alchemist-goto-list-symbol-definitions)
     ("M-`" . alchemist-test-file))
  :config
  (unbind-key "M-w" alchemist-mode-map)
  )


(use-package kotlin-mode
  :defer t)

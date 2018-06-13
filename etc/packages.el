(eval-when-compile
  (require 'use-package))

;; LIBS
(use-package go-mode
  :defer t)

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
  :init
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    (setenv "GOPATH" "/home/exu")
    (setq exec-path (append exec-path (list (expand-file-name "~/bin/"))))
    (setq exec-path (append exec-path (list (expand-file-name "/usr/local/go/bin/"))))
    (bind-key [remap find-tag] #'godef-jump)
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

    )


  :config
  (add-hook 'go-mode-hook 'electric-pair-mode))


(use-package ag
  :ensure t
  :commands (ag ag-regexp ag-project))

(use-package projectile
  :defer t)

(use-package fzf)

(use-package multiple-cursors-mode
  :defer t)

(use-package magit
  :defer t)

(use-package yasnippet
  :defer t
  :init
  (progn (yas-global-mode))
  )

(use-package markdown-mode
  :mode ("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode)
  :config)

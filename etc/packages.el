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
    (bind-key [remap find-tag] #'godef-jump))
  :config
  (add-hook 'go-mode-hook 'electric-pair-mode))


(use-package ag
  :ensure t
  :commands (ag ag-regexp ag-project))

(use-package projectile
  :defer t)

(use-package fzf)

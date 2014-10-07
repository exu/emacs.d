;; (add-to-list 'load-path "~/.emacs.d/vendor/web-mode/")

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("websites.*templates.*\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("websites.*\\.html\\.php\\'" . web-mode))


(setq web-mode-engines-alist
      '(
        ("\\.html\\.twig\\'" . "twig")
        ("\\.html\\'" . "jinja")
        )
      )

(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (linum-mode 1)
  (whitespace-mode 0)
  (message "WEB MODE HOOK")
)
(add-hook 'web-mode-hook  'web-mode-hook)

(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)

(setq web-mode-comment-style 2)
(setq web-mode-indent-style 2)


(require 'less-css-mode)
(setq less-css-output-directory "../css")
(setq less-css-lessc-options '("--no-color" "-x"))

(require 'zencoding-mode)

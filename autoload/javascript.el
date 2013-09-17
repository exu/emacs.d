;; (autoload 'js2-mode "js2-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; (setq inferior-lisp-program "/opt/sbcl/bin/sbcl") ; your Lisp system
;; (add-to-list 'load-path "~/.emacs.d/vendor/slime")  ; your SLIME directory
;; (add-to-list 'load-path "~/.emacs.d/vendor/contrib")
;; (require 'slime)


;; ;;(require 'slime-js)
;; ;;(slime-setup)
;; (slime-setup '(slime-js))

;; (load "~/.emacs.d/vendor/slime/contrib/slime-repl.el")
;; (require 'slime-js)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js3-lazy-commas t)
 '(js3-lazy-operators t)
 '(js3-lazy-dots t)
 ;; '(js3-expr-indent-offset 2)
 ;; '(js3-paren-indent-offset 2)
 ;; '(js3-square-indent-offset 2)
 ;; '(js3-curly-indent-offset 2)
 '(js3-indent-level 4)
)

(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js3-mode))

(add-to-list 'load-path "~/.emacs.d/vendor/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js3-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


;;; Swank JS http://emacsrocks.com/e11.html

;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook (lambda () (slime-js-minor-mode 1)))
;(add-hook 'js3-mode-hook (lambda () (slime-js-minor-mode 1)))
;; (add-hook 'css-mode-hook
;;           (lambda ()
;;             (define-key css-mode-map "\s-x" 'slime-js-refresh-css)
;;             (define-key css-mode-map "\C-c\C-r" 'slime-js-embed-css)))



;; (require 'nodejs-mode)


;; ;;; Slime config
;; (set-default 'slime-js-target-url "http://localhost:3000")
;; ;;(set-default 'slime-js-connect-url "http://localhost:8009")
;; (set-default 'slime-js-connect-url "http://crm.jw.vm.edp")
;; (set-default 'slime-js-starting-url "/")
;; (set-default 'slime-js-swank-command "swank-js")
;; (set-default 'slime-js-swank-args '())
;; (set-default 'slime-js-browser-command "chromium-browser")
;; (set-default 'slime-js-browser-jacked-in-p nil)


;; (defun slime-js-run-swank ()
;;   "Runs the swank side of the equation."
;;   (interactive)
;;   (apply #'make-comint "swank-js"  slime-js-swank-command nil slime-js-swank-args))

;; (defun slime-js-jack-in-node ()
;;   "Start a swank-js server and connect to it, opening a repl."
;;   (interactive)
;;   (slime-js-run-swank)
;;   (sleep-for 1)
;;   (setq slime-protocol-version 'ignore)
;;   (slime-connect "localhost" 4005))

;; (defun slime-js-jack-in-browser ()
;;   "Start a swank-js server, connect to it, open a repl, open a browser, connect to that."
;;   (interactive)
;;   (slime-js-jack-in-node)
;;   (sleep-for 2)
;;   (slime-js-set-target-url slime-js-target-url)
;;   (shell-command (concat slime-js-browser-command " " slime-js-connect-url slime-js-starting-url))
;;   (sleep-for 3)
;;   (setq slime-remote-history nil)
;;   (slime-js-sticky-select-remote (caadr (slime-eval '(js:list-remotes))))
;;   (setq slime-js-browser-jacked-in-p t)
;;   (global-set-key [f5] 'slime-js-reload))

;; (defadvice save-buffer (after save-css-buffer activate)
;;   (when (and slime-js-browser-jacked-in-p (eq major-mode 'css-mode))
;;     (slime-js-refresh-css)))

;; (defun js2-eval-friendly-node-p (n)
;;   (or (and (js2-stmt-node-p n) (not (js2-block-node-p n)))
;;       (and (js2-function-node-p n) (js2-function-node-name n))))

;; (defun slime-js--echo-result (result &rest _)
;;   (message result))

;; (defun slime-js--replace-with-result (replacement beg end)
;;   (save-excursion
;;     (goto-char beg)
;;     (delete-char (- end beg))
;;     (insert replacement)))

;; (defun slime-js-eval-region (beg end &optional func)
;;   (lexical-let ((func (or func 'slime-js--echo-result))
;;                 (beg beg)
;;                 (end end))
;;     (slime-flash-region beg end)
;;     (slime-js-eval
;;      (buffer-substring-no-properties beg end)
;;      #'(lambda (s) (funcall func (cadr s) beg end)))))

;; (defun slime-js-eval-statement (&optional func)
;;   (let ((node (js2r--closest 'js2-eval-friendly-node-p)))
;;     (slime-js-eval-region (js2-node-abs-pos node)
;;                           (js2-node-abs-end node)
;;                           func)))

;; (defun slime-js-eval-current ()
;;   (interactive)
;;   (if (use-region-p)
;;       (slime-js-eval-region (point) (mark))
;;     (slime-js-eval-statement)))

;; (defun slime-js-eval-and-replace-current ()
;;   (interactive)
;;   (if (use-region-p)
;;       (slime-js-eval-region (point) (mark) 'slime-js--replace-with-result)
;;     (slime-js-eval-statement 'slime-js--replace-with-result)))

;; (define-key slime-js-minor-mode-map (kbd "C-x C-e") 'slime-js-eval-current)
;; (define-key slime-js-minor-mode-map (kbd "C-c C-e") 'slime-js-eval-and-replace-current)



(require 'coffee-mode)

(require 'json-mode)

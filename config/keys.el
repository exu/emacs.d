(put 'paredit-forward-barf-sexp 'disabled  "Fuck you!\n")
(put 'paredit-backward-barf-sexp 'disabled "Fuck you!\n")


(global-set-key (kbd "<menu>") 'mark-sexp)

(global-set-key [C-right] 'next-buffer)
(global-set-key [C-left] 'previous-buffer)

;require 'misc is needed for this hack
(global-set-key (kbd "M-s") 'forward-to-word)

;; (global-set-key [C-tab] 'yas/expand)
(global-set-key (kbd "<C-tab>") 'yas-expand)

;my maps for double key sets
(define-prefix-command 'exu-global-map)
(define-prefix-command 'exu-emacs-files-map)
(define-prefix-command 'exu-org-files-map)
(define-prefix-command 'exu-config-map)
(define-prefix-command 'exu-dir-map)
(define-prefix-command 'exu-workspace-map)
(define-prefix-command 'exu-project-map)
(define-prefix-command 'exu-run-map)
(define-prefix-command 'exu-run-macro-map)
(define-prefix-command 'exu-mode-based-map)

(global-set-key (kbd "<f1>") 'exu-global-map)

(global-set-key (kbd "<f1><f1>") (lambda () (interactive) (org-todo-list 1) ))
(global-set-key (kbd "<f1><f2>") 'org-agenda-list)
(global-set-key (kbd "<f1><f3>") 'two-third-window-width)

(global-set-key (kbd "<f1>+") 'text-scale-increase)
(global-set-key (kbd "<f1>-") 'text-scale-decrease)

(global-set-key (kbd "<f1>1") 'recentf-open-most-recent-file-1)
(global-set-key (kbd "<f1>2") 'recentf-open-most-recent-file-2)
(global-set-key (kbd "<f1>3") 'recentf-open-most-recent-file-3)
(global-set-key (kbd "<f1>4") 'recentf-open-most-recent-file-4)

(global-set-key (kbd "<f1>c") 'exu-config-map)
(global-set-key (kbd "<f1>ct") 'toggle-truncate-lines)

(global-set-key (kbd "<f1>d") 'dired-in-project-directory)
(global-set-key (kbd "<f1>f") 'find-grep-dired)


(global-set-key (kbd "<f1>D") 'exu-dir-map)
(global-set-key (kbd "<f1>DP") (lambda nil (interactive) (dired "~/.emacs.d/personal/")))
(global-set-key (kbd "<f1>DE") (lambda nil (interactive) (dired "~/.emacs.d/")))
(global-set-key (kbd "<f1>DD") (lambda nil (interactive) (dired "~/Dropbox/")))

(global-set-key (kbd "<f1>e") 'exu-emacs-files-map)
(global-set-key (kbd "<f1>ek") 'open-config-file-keys)
(global-set-key (kbd "<f1>eo") 'open-config-file-org)
(global-set-key (kbd "<f1>ep") 'open-config-file-projects)
(global-set-key (kbd "<f1>ei") 'open-config-file-init)
(global-set-key (kbd "<f1>em") 'open-config-file-modes)
(global-set-key (kbd "<f1>ec") 'open-config-file-common)
(global-set-key (kbd "<f1>ef") 'open-config-file-functions)
(global-set-key (kbd "<f1>eh") 'open-config-file-hooks)

(global-set-key (kbd "<f1>i") 'open-file-in-impatience-mode)
(global-set-key (kbd "<f1>B") 'open-file-in-browser)
(global-set-key (kbd "<f1>b") 'open-statics-file-in-browser)
(global-set-key (kbd "<f1>l") 'linum-mode)

(global-set-key (kbd "<f1>g") 'gitlab-merge-request)

(global-set-key (kbd "<f1>m") 'exu-run-macro-map)
(global-set-key (kbd "<f1>mt") 'macro-convert-time-to-float)
(global-set-key (kbd "<f1>m1") 'macro-if-braces)
(global-set-key (kbd "<f1>m2") 'macro-if-else-braces)
(global-set-key (kbd "<f1>m3") 'macro-one-level-array)


(global-set-key (kbd "<f1>o") 'exu-org-files-map)

(global-set-key (kbd "<f1>or") 'org-regenerate-index-file)
(global-set-key (kbd "<f1>oo") 'org-new-redmine-task)
(global-set-key (kbd "<f1>on") 'org-new-date-header)

(global-set-key (kbd "<f1>ow") 'org-open-work-wiki-index-file)
(global-set-key (kbd "<f1>ot") 'org-open-work-todo-file)
(global-set-key (kbd "<f1>oc") 'org-open-current-work-file)
(global-set-key (kbd "<f1>od") 'org-open-daily-file)
(global-set-key (kbd "<f1>oi") 'org-open-index-file)
(global-set-key (kbd "<f1>oP") 'org-open-presentations-file)
(global-set-key (kbd "<f1>op") (lambda nil (interactive) (dired "~/org/wiki/presentations/")))
(global-set-key (kbd "<f1>oa") 'org-open-architecture-file)
(global-set-key (kbd "<f1>oe") 'org-open-english-file)

(global-set-key (kbd "<f1>p") 'ido-switch-project)

(global-set-key (kbd "<f1>t") 'org-open-work-todo-file)
(global-set-key (kbd "<f1>T") 'php-regenerate-tags)
(global-set-key (kbd "<f1>q") 'open-recent-sql-file)
(global-set-key (kbd "<f1>s") 'open-scratch-buffer)

(global-set-key (kbd "<f1>y") 'copy-file-name-to-clipboard)

(global-set-key (kbd "<f1>w") 'exu-workspace-map)
(global-set-key (kbd "<f1>wc") (lambda nil (interactive) (dired "~/www/crm/")))
(global-set-key (kbd "<f1>wk") (lambda nil (interactive) (dired "~/www/kasia-gotuje/")))
(global-set-key (kbd "<f1>wr") (lambda nil (interactive) (dired "~/www/retro-kitchen/")))
(global-set-key (kbd "<f1>wd") (lambda nil (interactive) (dired "~/www/deployer/")))
(global-set-key (kbd "<f1>wp") (lambda nil (interactive) (dired "~/www/poligon")))

(global-set-key (kbd "<f2>") 'exu-run-map)

(global-set-key (kbd "<f2><f2>") 'save-some-buffers)
(global-set-key (kbd "<f2>b") 'magit-blame-mode)

(global-set-key (kbd "<f2>c") 'flyspell-buffer)
(global-set-key (kbd "<f2>K") 'kill-other-buffers)

(global-set-key (kbd "<f2>m") 'menu-bar-mode)

(global-set-key (kbd "<f2>e") 'run-erc-process)
(global-set-key (kbd "<f2>t") 'twit)

(global-set-key (kbd "<f2><f1>") 'flymake-mode)
(global-set-key (kbd "<f2><f3>") 'flyspell-mode)

(global-set-key (kbd "<f2>s") 'flyspell-mode)
(global-set-key (kbd "<f2>l") 'cycle-ispell-languages)
(global-set-key (kbd "<f2>|") 'follow-delete-other-windows-and-split)
(global-set-key (kbd "<f2>f") 'rgrep)
(global-set-key (kbd "<f2>F") 'php-rgrep-without-vendor)
(global-set-key (kbd "<f2>g") 'find-grep-dired)
(global-set-key (kbd "<f2>d") 'find-name-dired)

(global-set-key (kbd "<f2>w") 'org-export-work-todo)

;; Mode based keybindings
(global-set-key (kbd "<f3>") 'exu-mode-based-map)
(eval-after-load 'php-mode
  '(progn
     (define-key php-mode-map (kbd "<f3>n") 'php-symfony2-generate-namespace)
     (define-key php-mode-map (kbd "<f3>m") 'php-switch-to-web-mode)
     (define-key php-mode-map (kbd "<f3>u") 'php-symfony2-use)
     (define-key php-mode-map (kbd "M-]") 'php-symfony2-ac-services)
     (define-key php-mode-map (kbd "<f8>") 'geben)
     (define-key php-mode-map (kbd "C-<f8>") 'geben-end)
     (define-key php-mode-map (kbd "<f9>") 'php-toggle-test-src)
     (define-key php-mode-map (kbd "<C-f9>") 'php-run-unit)
     (define-key php-mode-map (kbd "<f10>") 'php-toggle-spec-src)
     (define-key php-mode-map (kbd "<C-f10>") 'php-run-spec)
     (define-key php-mode-map (kbd "C-=") 'php-psr2-fix)
     (define-key php-mode-map (kbd "C-_") 'php-run-cs-fixer-on-file)


     (define-key php-mode-map (kbd "C-S-l")
       (lambda ()
         (interactive)
         (smarter-move-beginning-of-line nil)
         (insert "public static ")
         ))

     (define-key php-mode-map (kbd "C-S-k")
       (lambda ()
         (interactive)
         (replace-string "^    function\\(.*\\){" "    function \\1\n    {" nil (point-min) (point-max))
         ))

     ))

(eval-after-load 'go-mode
  '(progn
     (define-key go-mode-map (kbd "<f10>") 'go-toggle-spec-src)
     ))

(eval-after-load 'js2-mode
  '(progn
     (define-key js2-mode-map (kbd "<f10>") 'js-toggle-spec-src)
     (define-key js2-mode-map (kbd "C-=") 'js-fix)
     ))

(eval-after-load 'org
  '(progn
     (define-key org-mode-map (kbd "<f3><f3>") 'org-export-uml-and-open)
     (define-key org-mode-map (kbd "<f3>m") 'org-export-md-update-images-path)
     (define-key org-mode-map (kbd "<C-menu>") 'org-next-link)
     (define-key org-mode-map (kbd "<C-S-menu>") 'org-previous-link)
     ))

(eval-after-load 'web-mode
  '(progn
     (define-key web-mode-map (kbd "<f3>m") 'php-switch-to-web-mode)
     (define-key web-mode-map (kbd "<f8>") 'geben)
     (define-key web-mode-map (kbd "C-<f8>") 'geben-end)
     ))

(global-set-key (kbd "<f4>") ( lambda () (interactive) ( dired ".")))

(global-set-key (kbd "<C-f4>") 'list-bookmarks)

(global-set-key (kbd "<M-C-f4>") (lambda () (interactive) (save-buffers-kill-emacs t) ))

;; Moving over errors
(global-set-key [(control .)] 'next-error)
(global-set-key [(control \,)] 'previous-error)
(global-set-key (kbd "C-c C-;") 'next-error)
(global-set-key (kbd "C-c C-'") 'previous-error)
(global-set-key (kbd "C-c C-.") 'flymake-goto-next-error)
(global-set-key (kbd "C-c C-,") 'flymake-goto-prev-error)

(global-set-key (kbd "C-c C-t") 'twittering-update-status-interactive)
(global-set-key (kbd "C-c m") 'eshell)

(global-set-key [(control \;)] 'comment-dwim-line)

(global-set-key "\M-." 'etags-select-find-tag-at-point)
(global-set-key "\M-?" 'etags-select-find-tag)
(global-set-key (kbd "C-M-]") 'complete-tag)
(global-set-key (kbd "M-[") 'auto-complete)
(global-set-key "\C-m"          'newline-and-indent)
(global-set-key (kbd "C-`")     'ido-goto-symbol)
(global-set-key (kbd "C-o") 'gpicker-find-file)
(global-set-key (kbd "C-S-o") 'open-line)
(global-set-key (kbd "C-c C-v") (lambda () (interactive) (gpicker-visit-project default-directory)))
(global-set-key (kbd "M-;") 'comment-dwim-line)

(global-set-key (kbd "C-+") 'cowsay-on-region)

(global-set-key (kbd "C-c C-x C-j")     'org-clock-jump-to-current-clock)

(define-key 'help-command "A" 'apropos)

(global-set-key (kbd "C-x C-d") ( lambda () (interactive) ( dired ".")))
(global-set-key (kbd "C-x C-z") 'ido-switch-project)
(global-set-key (kbd "C-X C-Z") 'ido-switch-project-and-git-status)
(global-set-key (kbd "C-x C-a") 'dired-in-project-directory)

;; prelude based keys
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x b") 'ibuffer)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x C-g") 'magit-status)

(global-set-key (kbd "C-x C-m") 'notmuch)

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x ^") 'join-line)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x p") 'proced)

(global-set-key (kbd "M-/") 'hippie-expand)


(global-set-key (kbd "C-c =") 'balance-windows)
(global-set-key (kbd "C-c o") 'other-window-and-enlarge-two-third)

(global-set-key (kbd "C-c d") 'diff-buffer-with-current-file)
(global-set-key (kbd "C-c e") 'eval-end-replace)
(global-set-key (kbd "C-c f") 'recentf-ido-find-file)
(global-set-key (kbd "C-c g") 'open-translate-site)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c r") 'send-to-redmine)
(global-set-key (kbd "C-c t") 'visit-term-buffer)
(global-set-key (kbd "C-c w") 'org-capture-default-work-todo)

;; Multiple cursors
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-RET") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c s") 'mc/cycle-forward)
(global-set-key (kbd "C-S-a") 'mc/mark-all-like-this)

(global-set-key (kbd "C-c a") 'mc/mark-all-in-region)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

(global-set-key (kbd "C-(") 'php-correct-parenthesis)
(global-set-key (kbd "C-)") 'kill-line-and-one-space)
(global-set-key (kbd "C-|") 'indent-function)

; Macros to less used keys
(global-set-key (kbd "<f5>") 'kmacro-start-macro)
(global-set-key (kbd "<f6>") 'kmacro-end-macro)
(global-set-key (kbd "<f7>") 'kmacro-end-and-call-macro)

(global-set-key (kbd "C-S-<f12>") 'org-publish-blog)
(global-set-key (kbd "C-<f12>") 'org-publish-wiki)
(global-set-key (kbd "C-S-<f12>") 'org-wiki-deploy)


(global-set-key (kbd "C-S-f") 'rgrep)
(global-set-key (kbd "C-S-d") 'find-grep-dired)
(global-set-key (kbd "C-S-b") 'magit-blame-mode)


(global-set-key (kbd "C-c C-d") 'ng-snip-show-docs-at-point)

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line] 'smarter-move-beginning-of-line)

(put 'paredit-forward-barf-sexp 'disabled  "Fuck you!\n")
(put 'paredit-backward-barf-sexp 'disabled "Fuck you!\n")

(global-set-key [C-right] 'next-buffer)
(global-set-key [C-left] 'previous-buffer)

;require 'misc is needed for this hack
(global-set-key (kbd "M-s") 'forward-to-word)

(global-set-key [C-tab] 'yas/expand)
(global-set-key (kbd "<C-tab>") 'yas/expand)

;my maps for double key sets
(define-prefix-command 'exu-global-map)
(define-prefix-command 'exu-emacs-files-map)
(define-prefix-command 'exu-org-files-map)
(define-prefix-command 'exu-dir-map)
(define-prefix-command 'exu-workspace-map)
(define-prefix-command 'exu-project-map)
(define-prefix-command 'exu-run-map)
(define-prefix-command 'exu-run-macro-map)

(global-set-key (kbd "<f1>") 'exu-global-map)

(global-set-key (kbd "<f1><f1>") 'org-agenda-list)
(global-set-key (kbd "<f1><f2>") (lambda () (interactive) (org-todo-list 1) ))

(global-set-key (kbd "<f1>1") 'recentf-open-most-recent-file-1)
(global-set-key (kbd "<f1>2") 'recentf-open-most-recent-file-2)
(global-set-key (kbd "<f1>3") 'recentf-open-most-recent-file-3)
(global-set-key (kbd "<f1>4") 'recentf-open-most-recent-file-4)


(global-set-key (kbd "<f1>d") 'exu-dir-map)
(global-set-key (kbd "<f1>dp") (lambda nil (interactive) (dired "~/.emacs.d/personal/")))
(global-set-key (kbd "<f1>de") (lambda nil (interactive) (dired "~/.emacs.d/")))
(global-set-key (kbd "<f1>dd") (lambda nil (interactive) (dired "~/Dropbox/")))

(global-set-key (kbd "<f1>e") 'exu-emacs-files-map)
(global-set-key (kbd "<f1>ek") 'open-personal-file-keys)
(global-set-key (kbd "<f1>eo") 'open-personal-file-org)
(global-set-key (kbd "<f1>ei") 'open-personal-file-init)
(global-set-key (kbd "<f1>em") 'open-config-file-modes)
(global-set-key (kbd "<f1>ec") 'open-config-file-common)
(global-set-key (kbd "<f1>ef") 'open-personal-file-functions)

(global-set-key (kbd "<f1>l") 'linum-mode)


(global-set-key (kbd "<f1>o") 'exu-org-files-map)
(global-set-key (kbd "<f1>ow") 'org-open-work-wiki-index-file)
(global-set-key (kbd "<f1>ot") 'org-open-work-todo-file)
(global-set-key (kbd "<f1>oc") 'org-open-current-work-file)
(global-set-key (kbd "<f1>od") 'org-open-daily-file)
(global-set-key (kbd "<f1>oi") 'org-open-index-file)
(global-set-key (kbd "<f1>op") 'org-open-private-todo-file)
(global-set-key (kbd "<f1>oo") 'org-new-redmine-task)
(global-set-key (kbd "<f1>on") 'org-new-date-header)

(global-set-key (kbd "<f1>p") 'exu-project-map)
(global-set-key (kbd "<f1>pb") 'switch-project-rachciach)
(global-set-key (kbd "<f1>pc") 'switch-project-crm)
(global-set-key (kbd "<f1>pd") 'switch-project-deployer)
(global-set-key (kbd "<f1>pe") 'switch-project-emacs)
(global-set-key (kbd "<f1>pk") 'switch-project-kg)
(global-set-key (kbd "<f1>pm") 'switch-project-emailparser)
(global-set-key (kbd "<f1>pp") 'switch-project-poligon)
(global-set-key (kbd "<f1>pr") 'switch-project-rk)
(global-set-key (kbd "<f1>pr") 'switch-project-tools)
(global-set-key (kbd "<f1>pq") 'switch-project-qarsn)

(global-set-key (kbd "<f1>t") 'org-open-work-todo-file)
(global-set-key (kbd "<f1>q") 'open-recent-sql-file)
(global-set-key (kbd "<f1>s") 'open-scratch-buffer)

(global-set-key (kbd "<f1>w") 'exu-workspace-map)
(global-set-key (kbd "<f1>wc") (lambda nil (interactive) (dired "~/Workspace/crm/")))
(global-set-key (kbd "<f1>wk") (lambda nil (interactive) (dired "~/Workspace/kasia-gotuje/")))
(global-set-key (kbd "<f1>wr") (lambda nil (interactive) (dired "~/Workspace/retro-kitchen/")))
(global-set-key (kbd "<f1>wd") (lambda nil (interactive) (dired "~/Workspace/deployer/")))
(global-set-key (kbd "<f1>wp") (lambda nil (interactive) (dired "~/Workspace/poligon")))

(global-set-key (kbd "<f2>") 'exu-run-map)

(global-set-key (kbd "<f2><f2>") 'save-some-buffers)
(global-set-key (kbd "<f2>b") 'magit-blame-mode)

(global-set-key (kbd "<f2>c") 'flyspell-buffer)

(global-set-key (kbd "<f2>m") 'exu-run-macro-map)
(global-set-key (kbd "<f2>mt") 'macro-convert-time-to-float)

(global-set-key (kbd "<f2>e") 'run-erc-process)
(global-set-key (kbd "<f2>t") 'twit)

(global-set-key (kbd "<f2><f1>") 'flymake-mode)
(global-set-key (kbd "<f2><f3>") 'flyspell-mode)

(global-set-key (kbd "C-c C-.") 'flymake-goto-next-error)
(global-set-key (kbd "C-c C-,") 'flymake-goto-prev-error)

(global-set-key (kbd "<f2>s") 'flyspell-mode)
(global-set-key (kbd "<f2>l") 'cycle-ispell-languages)

(global-set-key (kbd "<f2>|") 'follow-delete-other-windows-and-split)

(global-set-key (kbd "<f4>") ( lambda () (interactive) ( dired ".")))
(global-set-key (kbd "<C-f4>") 'list-bookmarks)
(global-set-key (kbd "<C-S-f4>") 'toggle-truncate-lines)
(global-set-key (kbd "<M-C-f4>") (lambda () (interactive) (save-buffers-kill-emacs t) ))


(global-set-key (kbd "<f2>f") 'rgrep)
(global-set-key (kbd "<f2>d") 'find-name-dired)

(global-set-key (kbd "C-c C-;") 'next-error)
(global-set-key (kbd "C-c C-'") 'previous-error)

(global-set-key (kbd "C-c C-t") 'twittering-update-status-interactive)


(global-set-key [(control .)] 'next-error)
(global-set-key [(control \,)] 'previous-error)
(global-set-key [(control \;)] 'comment-dwim-line)

(global-set-key "\M-." 'etags-select-find-tag-at-point)
(global-set-key "\M-?" 'etags-select-find-tag)
(global-set-key (kbd "C-M-]") 'complete-tag)
(global-set-key (kbd "M-[") 'auto-complete)
(global-set-key "\C-m"          'newline-and-indent)
(global-set-key (kbd "C-`")     'ido-goto-symbol)
(global-set-key (kbd "M-p")     'gpicker-find-file)
(global-set-key (kbd "C-c C-v") (lambda () (interactive) (gpicker-visit-project default-directory)))
(global-set-key (kbd "M-;") 'comment-dwim-line)

(global-set-key (kbd "C-c 1") 'wg-switch-to-index-1)
(global-set-key (kbd "C-c 2") 'wg-switch-to-index-2)
(global-set-key (kbd "C-c 3") 'wg-switch-to-index-3)
(global-set-key (kbd "C-c 4") 'wg-switch-to-index-4)
(global-set-key (kbd "C-c 5") 'wg-switch-to-index-5)
(global-set-key (kbd "C-c 6") 'wg-switch-to-index-6)
(global-set-key (kbd "C-c 0") 'wg-switch-to-index-0)

(global-set-key (kbd "C-c C-x C-j")     'org-clock-jump-to-current-clock)

(define-key 'help-command "A" 'apropos)

;; prelude based keys
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x \\") 'align-regexp)

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x b") 'ibuffer)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(global-set-key (kbd "C-x C-g") 'magit-status)

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x ^") 'join-line)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x p") 'proced)

(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "C-c d") 'diff-buffer-with-current-file)
(global-set-key (kbd "C-c f") 'recentf-ido-find-file)
(global-set-key (kbd "C-c r") 'send-to-redmine)
(global-set-key (kbd "C-c t") 'visit-term-buffer)
(global-set-key (kbd "C-c w") 'org-capture-default-work-todo)

;; Multiple cursors
(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-RET") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c s") 'mc/cycle-forward)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-in-region)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

(global-set-key (kbd "C-(") 'php-correct-parenthesis)

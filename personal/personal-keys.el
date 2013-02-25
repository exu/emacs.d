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
(define-prefix-command 'exu-dir-map)
(define-prefix-command 'exu-project-map)

(global-set-key (kbd "<f1>") 'exu-global-map)

(global-set-key (kbd "<f1><f1>") 'org-agenda-list)
(global-set-key (kbd "<f1><f2>") (lambda () (interactive) (org-todo-list 1) ))

(global-set-key (kbd "<f1>1") 'recentf-open-most-recent-file-1)
(global-set-key (kbd "<f1>2") 'recentf-open-most-recent-file-2)
(global-set-key (kbd "<f1>3") 'recentf-open-most-recent-file-3)
(global-set-key (kbd "<f1>4") 'recentf-open-most-recent-file-4)

(global-set-key (kbd "<f1>i") 'org-open-work-wiki-index-file)
(global-set-key (kbd "<f1>w") 'org-open-work-todo-file)
(global-set-key (kbd "<f1>c") 'org-open-current-work-file)
(global-set-key (kbd "<f1>p") 'org-open-private-todo-file)
(global-set-key (kbd "<f1>s") 'open-recent-sql-file)
(global-set-key (kbd "<f1>t") 'open-scratch-buffer)
(global-set-key (kbd "<f1>l") 'org-open-index-file)
(global-set-key (kbd "<f1>d") 'org-open-daily-file)
(global-set-key (kbd "<f1>m") 'macro-convert-time-to-float)
(global-set-key (kbd "<f1>n") 'org-new-date-header)
(global-set-key (kbd "<f1>b") 'magit-blame-mode)

(global-set-key (kbd "<f1>e") 'exu-emacs-files-map) ;; files
(global-set-key (kbd "<f1>ek") 'open-personal-file-keys)
(global-set-key (kbd "<f1>eo") 'open-personal-file-org)
(global-set-key (kbd "<f1>ei") 'open-personal-file-init)
(global-set-key (kbd "<f1>ef") 'open-personal-file-functions)

(global-set-key (kbd "<f2>") 'exu-dir-map) ;; dirs
(global-set-key (kbd "<f2>c") (lambda nil (interactive) (dired "~/Workspace/crm/")))
(global-set-key (kbd "<f2>d") (lambda nil (interactive) (dired "~/Workspace/deployer/")))
(global-set-key (kbd "<f2>m") (lambda nil (interactive) (dired "~/.emacs.d/personal/")))
(global-set-key (kbd "<f2>e") (lambda nil (interactive) (dired "~/.emacs.d/")))
(global-set-key (kbd "<f2>p") (lambda nil (interactive) (dired "~/Workspace/poligon")))
(global-set-key (kbd "<f2>r") (lambda nil (interactive) (dired "~/Dropbox/")))

(global-set-key (kbd "<f3>") 'exu-project-map)
(global-set-key (kbd "<f3>d") 'switch-project-deployer)
(global-set-key (kbd "<f3>c") 'switch-project-crm)
(global-set-key (kbd "<f3>r") 'switch-project-rk)
(global-set-key (kbd "<f3>k") 'switch-project-kg)
(global-set-key (kbd "<f3>p") 'switch-project-poligon)
(global-set-key (kbd "<f3>m") 'switch-project-emailparser)
(global-set-key (kbd "<f3>b") 'switch-project-rachciach)



;;(global-set-key (kbd "<f1>") 'org-agenda-list)
;; (global-set-key (kbd "<C-f1>") (lambda () (interactive) (org-todo-list 1) ))
;; (global-set-key (kbd "<C-S-f1>") 'org-open-index-file)
;; (global-set-key (kbd "<C-M-f1>") 'org-open-daily-file)
;; (global-set-key (kbd "<s-f1>") 'open-scratch-buffer)

(global-set-key (kbd "<s-f2>") 'save-buffer)
(global-set-key (kbd "<C-f2>") 'save-some-buffers)

(global-set-key (kbd "<C-f3>") 'follow-delete-other-windows-and-split)

(global-set-key (kbd "<f4>") ( lambda () (interactive) ( dired ".")))
(global-set-key (kbd "<C-f4>") 'list-bookmarks)
(global-set-key (kbd "<C-S-f4>") 'toggle-truncate-lines)
(global-set-key (kbd "<M-C-f4>") (lambda () (interactive) (save-buffers-kill-emacs t) ))

(global-set-key (kbd "<f5>") 'flymake-mode)
(global-set-key (kbd "<C-f5>") 'flymake-goto-next-error)
(global-set-key (kbd "<C-S-f5>") 'flymake-goto-prev-error)

(global-set-key (kbd "<f6>") 'flyspell-mode)
(global-set-key (kbd "<C-f6>") 'cycle-ispell-languages)

(global-set-key (kbd "<f7>") 'rgrep)
;;(global-set-key (kbd "<f7>") 'ack)
(global-set-key (kbd "<C-f7>") 'find-name-dired)

(global-set-key (kbd "<f8>") 'next-error)
(global-set-key (kbd "<C-f8>") 'previous-error)

(global-set-key (kbd "<f9>") (lambda () (interactive) (erc :server "irc.freenode.net" :port 6667 :nick "ex00") ) )
(global-set-key (kbd "<C-f9>") 'twit)
(global-set-key "\C-c\C-t" 'twittering-update-status-interactive)

(global-set-key (kbd "<f11>") (lambda ()
                                (interactive)
                                (save-buffer)
                                (vc-next-action nil)
                              ))

(global-set-key (kbd "<C-f11>") (lambda ()
                                  (interactive)
                                  (svn-status)
                                  (svn-status-update (dired))
                                  ))

;;(global-set-key (kbd "<C-f12>") 'open-scratch-buffer)
;;(global-set-key (kbd "<C-S-f12>") 'open-recent-sql-file)

(global-set-key [(control .)] 'etags-select-find-tag-at-point)
(global-set-key [(control \;)] 'comment-dwim-line)
(global-set-key [(control \,)] 'recentf-ido-find-file)

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


;; prelude based keys
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))

(global-set-key (kbd "C-x ^") 'join-line)
(global-set-key (kbd "C-x p") 'proced)
(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))
(global-set-key (kbd "C-x M-m") 'shell)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(define-key 'help-command "A" 'apropos)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "C-c f")  'recentf-ido-find-file)

(global-set-key (kbd "C-c r") 'send-to-redmine)

(global-set-key (kbd "C-c w") 'org-capture-default-work-todo)
(global-set-key (kbd "C-c d") 'diff-buffer-with-current-file)
(global-set-key (kbd "C-c t") 'visit-term-buffer)

(global-set-key (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-RET") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c s") 'mc/cycle-forward)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-in-region)
(global-set-key (kbd "C-c SPC") 'mc/create-fake-cursor-at-point)

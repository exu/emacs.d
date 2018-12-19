(put 'paredit-forward-barf-sexp 'disabled  "Fuck you!\n")
(put 'paredit-backward-barf-sexp 'disabled "Fuck you!\n")

(global-set-key [C-right] 'next-buffer)
(global-set-key [C-left] 'previous-buffer)

;; (global-set-key [C-tab] 'yas/expand)
(global-set-key (kbd "<C-tab>") 'yas-expand)

;my maps for double key sets
(define-prefix-command 'exu-global-map)
(define-prefix-command 'exu-ctrl-z-map)
(define-prefix-command 'exu-emacs-files-map)
(define-prefix-command 'exu-org-files-map)
(define-prefix-command 'exu-config-map)
(define-prefix-command 'exu-dir-map)
(define-prefix-command 'exu-workspace-map)
(define-prefix-command 'exu-project-map)
(define-prefix-command 'exu-run-map)
(define-prefix-command 'exu-run-macro-map)
(define-prefix-command 'exu-mode-based-map)
(define-prefix-command 'exu-google-translate-map)

(global-set-key (kbd "C-z") 'exu-ctrl-z-map)
(global-set-key (kbd "C-z b") 'magit-blame-mode)
(global-set-key (kbd "C-z C-z") 'suspend-frame)
(global-set-key (kbd "C-z t") 'org-open-home-todo-file)
(global-set-key (kbd "C-z e") 'org-open-english-file)
(global-set-key (kbd "C-z w") 'org-open-work-todo-file)
(global-set-key (kbd "C-z s") 'open-scratch-buffer)
(global-set-key (kbd "C-z q") 'open-recent-sql-file)
(global-set-key (kbd "C-z m") 'run-make)
(global-set-key (kbd "C-z z") (lambda () (interactive) (org-todo-list 1) ))
(global-set-key (kbd "C-z a") 'org-agenda-list)
(global-set-key (kbd "C-z p") 'toggle-face-height)
(global-set-key (kbd "C-z C-f") 'ido-open-file)

(global-set-key (kbd "<f1>") 'exu-global-map)
(global-set-key (kbd "<f1><f1>") 'save-some-buffers)
(global-set-key (kbd "<f1><f3>") 'two-third-window-width)

(global-set-key (kbd "<f1>+") 'text-scale-increase)
(global-set-key (kbd "<f1>=") 'text-scale-increase)
(global-set-key (kbd "<f1>-") 'text-scale-decrease)

(global-set-key (kbd "<f1>1") 'recentf-open-most-recent-file-1)
(global-set-key (kbd "<f1>2") 'recentf-open-most-recent-file-2)
(global-set-key (kbd "<f1>3") 'recentf-open-most-recent-file-3)
(global-set-key (kbd "<f1>4") 'recentf-open-most-recent-file-4)

(global-set-key (kbd "<f1>B") 'open-file-in-browser)
(global-set-key (kbd "<f1>c") 'flyspell-buffer)

(global-set-key (kbd "<f1>l") 'linum-mode)
(global-set-key (kbd "<f1>k") 'kill-other-buffers)

(global-set-key (kbd "<f1>n") 'cycle-ispell-languages)
(global-set-key (kbd "<f1>s") 'flyspell-mode)

(global-set-key (kbd "<f1>t") 'toggle-truncate-lines)
(global-set-key (kbd "<f1>T") 'php-regenerate-tags)
(global-set-key (kbd "<f1>y") 'copy-file-name-to-clipboard)
(global-set-key (kbd "<f1>|") 'follow-delete-other-windows-and-split)
(global-set-key (kbd "<f5>") 'kmacro-call-macro)

(global-set-key (kbd "<C-f1>") (lambda nil (interactive) (zone)))


;; Mode based keybindings
(global-set-key (kbd "<f2>") 'exu-mode-based-map)
(eval-after-load 'php-mode
  '(progn
     (define-key php-mode-map (kbd "<f2>n") 'php-symfony2-generate-namespace)
     (define-key php-mode-map (kbd "<f2>m") 'php-switch-to-web-mode)
     (define-key php-mode-map (kbd "<f2>u") 'php-symfony2-use)
     (define-key php-mode-map (kbd "M-]") 'php-symfony2-ac-services)
     (define-key php-mode-map (kbd "<f8>") 'geben)
     (define-key php-mode-map (kbd "C-<f8>") 'geben-end)
     (define-key php-mode-map (kbd "<f9>") 'php-toggle-test-src)
     (define-key php-mode-map (kbd "<C-f9>") 'php-run-unit)
     (define-key php-mode-map (kbd "<f10>") 'php-toggle-spec-src)
     (define-key php-mode-map (kbd "<C-f10>") 'php-run-spec)
     (define-key php-mode-map (kbd "C-=") 'php-psr2-fix)
     (define-key php-mode-map (kbd "C-_") 'php-run-cs-fixer-on-file)
     (define-key php-mode-map (kbd "C-S-k")
       (lambda () (interactive)
         (replace-regexp "^    function\\(.*\\)\s*{" "    function \\1\n    {" nil (point-min) (point-max)))) ))

(eval-after-load 'go-mode
  '(progn
     (define-key go-mode-map (kbd "<f10>") 'go-toggle-spec-src)
     (define-key go-mode-map (kbd "C-c C-f") 'godoc)
     (define-key go-mode-map (kbd "C-c C-a") 'go-import-add)
     ))

(eval-after-load 'js2-mode
  '(progn
     (define-key js2-mode-map (kbd "<f10>") 'js-toggle-spec-src)
     (define-key js2-mode-map (kbd "<f9>") 'js-toggle-test-src)
     (define-key js2-mode-map (kbd "C-=") 'js-jshint-fix)
     ))

(eval-after-load 'org
  '(progn
     (define-key org-mode-map (kbd "<f2><f2>") 'org-export-uml-and-open)
     (define-key org-mode-map (kbd "<f2>m") 'org-export-md-update-images-path)
     (define-key org-mode-map (kbd "<C-menu>") 'org-next-link)
     (define-key org-mode-map (kbd "<C-S-menu>") 'org-previous-link)
     (define-key org-mode-map (kbd "<C-tab>") 'yas-expand)
     ))

(eval-after-load 'web-mode
  '(progn
     (define-key web-mode-map (kbd "<f2>m") 'php-switch-to-web-mode)
     (define-key web-mode-map (kbd "<f8>") 'geben)
     (define-key web-mode-map (kbd "C-<f8>") 'geben-end)
     ))

(eval-after-load 'python-mode
  '(progn
     (define-key python-mode-map (kbd "<f8>") 'run-python-koans)
     ))

(global-set-key (kbd "<C-f4>") 'list-bookmarks)
(global-set-key (kbd "<M-C-f4>") (lambda () (interactive) (save-buffers-kill-emacs t) ))

;; Moving over errors
(global-set-key [(control .)] 'next-error)
(global-set-key [(control \,)] 'previous-error)
(global-set-key (kbd "C-c C-;") 'next-error)
(global-set-key (kbd "C-c C-'") 'previous-error)

(global-set-key (kbd "C-c m") 'eshell)
(global-set-key (kbd "C-c 5") 'md5-region)

;; (global-set-key "\M-." 'etags-select-find-tag-at-point)
;; (global-set-key "\M-?" 'etags-select-find-tag)
(global-set-key (kbd "C-M-]") 'complete-tag)
(global-set-key "\C-m"          'newline-and-indent)
(global-set-key (kbd "C-S-o") 'open-line)
(global-set-key (kbd "M-;") 'comment-dwim-line)
(global-set-key (kbd "M-*") 'pop-tag-mark)

(global-set-key (kbd "C-+") 'cowsay-on-region)

(global-set-key (kbd "C-c C-x C-j")     'org-clock-jump-to-current-clock)

(define-key 'help-command "A" 'apropos)

(global-set-key (kbd "C-x C-d") ( lambda () (interactive) ( dired ".")))
(global-set-key (kbd "C-x C-z") 'ido-switch-project)
(global-set-key (kbd "C-S-x C-S-z") 'ido-switch-project-and-git-status)
(global-set-key (kbd "C-x C-a") 'dired-in-project-directory)
(global-set-key (kbd "C-`")     'ido-goto-symbol)

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

(global-set-key (kbd "C-x C-j") 'dired-jump)
(define-key dired-mode-map (kbd "C-j") 'dired-up-directory)



(global-set-key (kbd "M-/") 'hippie-expand)


(global-set-key (kbd "C-c =") 'balance-windows)
(global-set-key (kbd "C-c o") 'other-window-and-enlarge-two-third)

(global-set-key (kbd "C-c d") 'diff-buffer-with-current-file)
(global-set-key (kbd "C-c e") 'eval-end-replace)
(global-set-key (kbd "C-c f") 'recentf-ido-find-file)

(global-set-key (kbd "C-c g") 'exu-google-translate-map)
(global-set-key (kbd "C-c g g") 'open-translate-site)
(global-set-key (kbd "C-c g p") 'word-at-point-translate-from-en-to-pl)
(global-set-key (kbd "C-c g e") 'word-at-point-translate-from-pl-to-en)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c t") 'visit-term-buffer)
(global-set-key (kbd "C-c w") 'org-capture-default-work-todo)

(global-set-key (kbd "C-)") 'kill-line-and-one-space)
(global-set-key (kbd "C-|") 'indent-function)

(global-set-key (kbd "C-S-f") 'search-string-in-project-dir) ;; 'rgrep)
(global-set-key (kbd "C-S-g") 'ag)
(global-set-key (kbd "C-S-d") 'find-grep-dired)
(global-set-key (kbd "C-S-b") 'magit-blame)
(global-set-key (kbd "C-S-n") 'find-name-dired)

(global-set-key (kbd "<C-down-mouse-1>") 'highlight-symbol-on-click)
(global-set-key (kbd "C-S-s") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "C-c C-d") 'ng-snip-show-docs-at-point)
(global-set-key [remap move-beginning-of-line] 'smarter-move-beginning-of-line)

;; Global mode
(defvar exu-minor-mode-map (make-keymap) "exu-minor-mode keymap.")

(define-key exu-minor-mode-map (kbd "M-<up>") 'windmove-up)
(define-key exu-minor-mode-map (kbd "M-<down>") 'windmove-down)
(define-key exu-minor-mode-map (kbd "M-<right>") 'windmove-right)
(define-key exu-minor-mode-map (kbd "M-<left>") 'windmove-left)

(define-key exu-minor-mode-map (kbd "M-p") 'fzf)
(define-key exu-minor-mode-map (kbd "M-o") 'other-window)

(define-key exu-minor-mode-map (kbd "<C-left>") 'previous-buffer)
(define-key exu-minor-mode-map (kbd "<C-right>") 'next-buffer)

(define-key exu-minor-mode-map (kbd "<M-;>") 'comment-dwim-line) ;;in custom functions


;; Multiple cursors
(define-key exu-minor-mode-map (kbd "M-n") 'mc/mark-next-like-this)
(global-set-key (kbd "M-RET") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c s") 'mc/cycle-forward)
(global-set-key (kbd "C-S-a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)




(define-minor-mode exu-minor-mode
  "Global minor mode"
  t " Gl" 'exu-minor-mode-map)


(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'exu-minor-mode))
      (let ((mykeys (assq 'exu-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'exu-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)

(exu-minor-mode 1)

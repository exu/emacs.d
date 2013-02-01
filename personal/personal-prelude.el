(defun prelude-prog-mode-hook ()
 "Default coding hook, useful with any programming language."
 (flyspell-prog-mode nil)
 (prelude-local-comment-auto-fill)
 ;;(prelude-turn-off-whitespace)
 (prelude-turn-on-abbrev)
 (prelude-add-watchwords)
 (linum-mode +1)

 ;; keep the whitespace decent all the time
 (add-hook 'before-save-hook 'whitespace-cleanup nil t))

;; change to zsh
(defun prelude-visit-term-buffer ()
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (ansi-term "/bin/zsh")
    (switch-to-buffer "*ansi-term*")))


;; (add-hook 'web-mode-hook 'whitespace-turn-off)


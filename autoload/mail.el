(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
;; installed from sources
(require 'notmuch)

(setq notmuch-message-headers-visible nil)
(setq notmuch-fcc-dirs '((".*" . "SENT")))

(require 'bbdb)
;;(bbdb-initialize)
(bbdb-initialize 'gnus 'message)


(require 'bbdb-vcard)

;; (add-hook 'mail-setup-hook 'bbdb-insinuate-


(defun notmuch-get-unread-count ()
  (number-to-string(string-to-number (shell-command-to-string (concat notmuch-command " search tag:unread|wc -l"))))
  )


(define-key notmuch-search-mode-map "e"
  (lambda ()
    "remove inbox and mark as read"
    (interactive)
    (notmuch-search-tag '("-inbox" "-unread"))
    (next-line 1)
    ))

(define-key notmuch-search-mode-map "E"
  (lambda ()
    "mark messages in thread as spam"
    (interactive)
    (notmuch-search-tag-all '("-inbox" "-unread"))
    ))


(add-to-list 'mode-line-format (notmuch-get-unread-count))

(setq notmuch-message-headers-visible nil)
(setq notmuch-fcc-dirs '((".*" . "SENT")))

(require 'bbdb)
;;(bbdb-initialize)
(bbdb-initialize 'gnus 'message)


(require 'bbdb-vcard)

;; (add-hook 'mail-setup-hook 'bbdb-insinuate-


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

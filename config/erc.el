(require 'erc)
(load "~/.ercpass")
(require 'erc-services)
(erc-services-mode 1)

(setq erc-autojoin-channels-alist
      '(
        ("freenode.net" "#emacs" "#symfony-pl" "#sylius")
        ("194.126.207.20" "#IOKI")
        )) ;;"#symfony" "#scala" "##php" "#symfony-pl" "#jquery", "#vim"

(setq erc-prompt-for-nickserv-password nil)
(setq erc-nickserv-passwords  `((freenode     (("ex00" . ,freenode-ex00-pass)))))

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"

                                 "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

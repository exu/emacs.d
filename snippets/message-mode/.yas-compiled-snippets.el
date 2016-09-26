;;; Compiled snippets and support files for `message-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'message-mode
                     '(("urlop" "`(progn (delete-region (point) (search-backward \"To:\" nil t)))`\n\nTo: dominik.flejter@edpauto.com\nSubject: JACEK WYSOCKI - Urlop wypoczynkowy od $1 do $2\nFcc: /home/exu/Mail/SENT\n--text follows this line--\n\nWNIOSEK URLOPOWY\n    IMIĘ I NAZWISKO: JACEK WYSOCKI\n    Proszę o udzielenie mi (zaznaczyć właściwy kwadrat):\n[X] urlopu wypoczynkowego\n[ ] urlopu na żądanie (Art. 1672  Kodeksu pracy)\n[ ] urlopu okolicznościowego z tytułu  ....................\n[ ] urlopu bezpłatnego\n[ ] dnia opieki nad dzieckiem (Art. 188 Kodeksu pracy)\n     w terminie: od $1 do $2\n     w tym ilość dni roboczych $4\n     w tym ilość godzin ${4:$(* 8 (string-to-number yas-text))}\n" "urlop" nil
                        ("default")
                        nil "/home/exu/.emacs.d/snippets/message-mode/urlop" nil nil)))


;;; Do not edit! File generated at Thu Sep 22 07:19:53 2016

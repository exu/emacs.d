(fset 'macro-convert-time-to-float
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([5 134217826 134217826 201326624 201326624 C-insert 5 32 25 134217730 134217730 201326624 201326624 134217848 99 111 110 118 tab return 1 14] 0 "%d")) arg)))

;; adding { } to if
(fset 'macro-if-braces
        (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([5 32 125 backspace 123 14 5 return 125 tab] 0 "%d")) arg)))

;; adding { } { } to if else
(fset 'macro-if-else-braces
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([5 32 123 14 14 1 125 33554464 5 32 123 14 5 return 125 tab] 0 "%d")) arg)))

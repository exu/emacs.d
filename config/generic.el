(require 'generic-x)

(define-generic-mode
  'gitignore-mode                  ;; name of the mode to create
  '("#")                           ;; comments start with #
  '("tmp")                         ;; some keywords
  '(("\/" . 'font-lock-constant-face) ;; font faces
    ("*" . 'font-lock-keyword-face))
  '("\\.gitignore$")               ;; files for which to activate this mode
  nil                              ;; other functions to call
  "A mode for gitignore files"     ;; doc string for this mode
  )

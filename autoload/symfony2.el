(defgroup symfony2 nil
  "Symfony2 Development."
  :group 'programming)

(defcustom symfony2-php-style
  '((c-offsets-alist . ((case-label . +)
                        (arglist-intro . +) ; for FAPI arrays and DBTNG
                        (arglist-cont-nonempty . c-lineup-math) ; for DBTNG fields and values
                        (arglist-close . c-lineup-close-paren) ; correct arglist closing parenthesis
                        )))
  "PSR coding style."
  :group 'symfony2)

(define-derived-mode symfony2-mode
  php-mode "Sf2"
  "Major mode for working with Symfony2.
\\{symfony2-mode-map}"
  (c-set-style "symfony2-php-style")
  (set 'tab-width 4)
  (set 'c-basic-offset 4)
  (set 'indent-tabs-mode nil))

(c-add-style "symfony2-php-style" symfony2-php-style)

(provide 'symfony2-mode)

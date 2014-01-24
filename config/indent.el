;; Text formattig and indenting
(set-fill-column 120)
(setq fill-column 120)
(setq whitespace-line-column 120)
(setq whitespace-style (quote (face trailing tabs newline tab-mark newline-mark)))
(setq whitespace-display-mappings
 '(
   (space-mark 32 [183] [46]) ; normal space, ·
   (space-mark 160 [164] [95])
   (space-mark 2208 [2212] [95])
   (space-mark 2336 [2340] [95])
   (space-mark 3616 [3620] [95])
   (space-mark 3872 [3876] [95])
   (newline-mark 10 [172 10]) ; newlne, ¶¬
   (tab-mark 9 [9655 9] [92 9]) ; tab, ▷ 9655
   ))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default yaml-indent-offset 4)
(setq-default js-indent-level 4)
(setq js2-basic-offset 4)

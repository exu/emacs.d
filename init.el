(defvar root-dir (file-name-directory load-file-name))

(load (concat root-dir "paths.el"))
(require 'dash)

(add-to-list 'custom-theme-load-path themes-dir)
(load-theme 'zenburn t)

(mapc 'load (directory-files personal-dir 't "^[^#].*el$"))


(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(put 'narrow-to-region 'disabled nil)

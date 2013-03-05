(defvar root-dir (file-name-directory load-file-name))

(defun add-subfolders-to-load-path (parent-dir)
  "Adds all first level `parent-dir' subdirs to the
Emacs load path."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))


(defvar root-dir (file-name-directory load-file-name))
;; (defvar modules-dir (expand-file-name  "modules" root-dir))
(defvar personal-dir (expand-file-name "personal" root-dir))
(defvar vendor-dir (expand-file-name "vendor" root-dir))
(defvar themes-dir (expand-file-name "themes" root-dir))
(defvar savefile-dir (expand-file-name "var" root-dir))
(defvar elpa-dir (expand-file-name "elpa" root-dir))
(defvar snippets-dir (expand-file-name "snippets" root-dir))
(setq custom-file (expand-file-name "custom.el" personal-dir))

;; (add-to-list 'load-path modules-dir)
(add-to-list 'load-path themes-dir)
(add-to-list 'load-path vendor-dir)

(add-subfolders-to-load-path vendor-dir)
(add-subfolders-to-load-path elpa-dir)

(require 'dash)

(add-to-list 'custom-theme-load-path themes-dir)
(load-theme 'zenburn t)

(mapc 'load (directory-files personal-dir 't "^[^#].*el$"))


(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(put 'narrow-to-region 'disabled nil)

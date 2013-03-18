(defvar root-dir "~/.emacs.d/")
(defvar dotfiles-dir root-dir)
(defvar autload-dir (expand-file-name "autoload" root-dir))
(defvar vendor-dir (expand-file-name "vendor" root-dir))
(defvar themes-dir (expand-file-name "themes" root-dir))
(defvar savefile-dir (expand-file-name "var" root-dir))
(defvar elpa-dir (expand-file-name "elpa" root-dir))
(defvar snippets-dir (expand-file-name "snippets" root-dir))


(defun add-subfolders-to-load-path (parent-dir)
  "Adds all first level `parent-dir' subdirs to the Emacs load path."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(setq custom-file (expand-file-name "custom.el" autload-dir))

(add-to-list 'load-path themes-dir)
(add-to-list 'load-path vendor-dir)

(add-subfolders-to-load-path vendor-dir)
(add-subfolders-to-load-path elpa-dir)

(setq bookmark-default-file (concat dotfiles-dir "bookmarks/bookmarks-" system-name ".el"))
(setq bookmark-save-flag 1)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/var/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/var/backups/"))))

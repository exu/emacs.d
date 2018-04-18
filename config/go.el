(setenv "GOOS" "linux")
(setenv "GOARCH" "amd64")
(setenv "GOPATH" "/home/exu/")
(setenv "PATH" (concat (getenv "PATH")
                       ":" "~/pkg/linux_amd64" ":" "~/bin/" ":" "/usr/local/go/bin/"
                       ":" "/usr/local/go/bin/" ":" "~/src/"
                       ))


;; (setq gofmt-command "goimports")
(setq gofmt-command "gofmt")

;; (require 'go-koans)
;;(require 'go-mode-load)
(require 'go-mode-autoloads)
;; (add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))


(setq exec-path (append exec-path (list (expand-file-name "~/bin/"))))
(setq exec-path (append exec-path (list (expand-file-name "/usr/local/go/bin/"))))

;; https://github.com/dougm/goflymake install needed
;; go get -u github.com/dougm/goflymake
;; (require 'go-flymake)


;; https://github.com/nsf/gocode
;; go get -u github.com/nsf/gocode
(require 'go-autocomplete)
(require 'auto-complete-config)


;; It’s really useful to be able to able to pull up
;; 3rd party or standard library docs from within Emacs
;; using the godoc tool.
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

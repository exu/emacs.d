(setenv "GOOS" "linux")
(setenv "GOARCH" "amd64")
(setenv "GOPATH" "~/go")
(setenv "PATH" (concat (getenv "PATH") ":" "~/go/pkg/linux_amd64" ":" "~/go/bin/" ":" "/usr/local/go/bin/"))

;; (require 'go-koans)
(require 'go-mode-load)
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))

(setq exec-path (append exec-path (list (expand-file-name "~/go/bin/"))))
(setq exec-path (append exec-path (list (expand-file-name "~/.gvm/gos/go1.1/bin/" "/usr/local/go/bin/"))))

;; https://github.com/dougm/goflymake install needed
;; go get -u github.com/dougm/goflymake
(require 'go-flymake)


;; https://github.com/nsf/gocode
(require 'go-autocomplete)
(require 'auto-complete-config)

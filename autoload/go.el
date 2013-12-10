
;; go get -u github.com/dougm/goflymake

(setenv "GOOS" "linux")
(setenv "GOARCH" "amd64")
(setenv "GOPATH" "~/go")
(setenv "PATH" (concat (getenv "PATH") ":" "~/Appz/go/pkg/linux_amd64"))

;; (require 'go-koans)
(require 'go-mode-load)
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))

;; https://github.com/dougm/goflymake install needed
(require 'go-flymake)

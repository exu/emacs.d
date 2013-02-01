(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

;; (define-key my-keys-minor-mode-map (kbd "C-i") 'some-function)

(define-key my-keys-minor-mode-map (kbd "M-<up>") 'windmove-up)
(define-key my-keys-minor-mode-map (kbd "M-<down>") 'windmove-down)
(define-key my-keys-minor-mode-map (kbd "M-<right>") 'windmove-right)
(define-key my-keys-minor-mode-map (kbd "M-<left>") 'windmove-left)


(define-key my-keys-minor-mode-map (kbd "M-p") 'gpicker-find-file)
(define-key my-keys-minor-mode-map (kbd "M-o") 'other-window)

(define-key my-keys-minor-mode-map (kbd "<C-left>") 'previous-buffer)
(define-key my-keys-minor-mode-map (kbd "<C-right>") 'next-buffer)

(define-key my-keys-minor-mode-map (kbd "<M-;>") 'comment-dwim-line) ;;in custom functions


(define-minor-mode my-keys-minor-mode
  "Global minor mode"
  t " Gl" 'my-keys-minor-mode-map)


(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)

(my-keys-minor-mode 1)

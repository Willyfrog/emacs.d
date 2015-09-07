;;; my_go --- configuracion para edicion de go
;;; Commentary:
;; partially copied from
;; http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/

(require 'go-mode)
(require 'go-complete)
(require 'go-oracle)

(defun my-go-mode-hook ()
  ; Call Gofmt before saving
                                        ; but instead of gofmt use goimports
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  ; use go-complete as a backend
  (add-hook 'completion-at-point-functions 'go-complete-at-point)
  (setq tab-width 4)
  ; use eldoc for go definitions
  (go-eldoc-setup))

(provide 'my_go)
;;; my_go ends here

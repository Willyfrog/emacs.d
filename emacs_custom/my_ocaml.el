;;; my_ocaml --- configuracion para editar OCaml
;;; Comentary
;; for updates check: https://github.com/realworldocaml/book/wiki/Installation-Instructions

(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist)) 
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)

(provide 'my_ocaml)
;; my_ocaml ends here

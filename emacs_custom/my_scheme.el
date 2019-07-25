;;; my_scheme

;(require 'quack)

(defun my-scheme-mode-hook ()
  (setq scheme-program-name "mit-scheme")
  (my-lispy-common-config)
  )

(provide 'my_scheme)

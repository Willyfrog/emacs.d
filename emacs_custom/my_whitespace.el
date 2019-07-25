;;; my_whitespace -- configuracion de whitespace-mode
;;; Comentary:
;; prevent those pesky trailing whitespaces messing with the code
;;; Code:
;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
;; activate globally
(global-whitespace-mode 1)

(provide 'my_whitespace)

;;; my_kotlin --- configuracion para edicion de kotlin
;;; Commentary:
;;  to be upgraded with new info
;;; Code:
(require 'gradle-mode)


(eval-after-load 'flycheck
  '(progn 
    (require 'flycheck-kotlin)
    (flycheck-kotlin-setup)))

(custom-set-variables '(gradle-use-gradlew t) '(kotlin-tab-width 4))

(defun my-kotlin-mode-hook ()
  "Extra functions to be enabled whenever kotlin mode is turned on."
  (gradle-mode 1))

(provide 'my_kotlin)
;;; my_kotlin ends here

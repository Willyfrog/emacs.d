;;; my_js -- Custom configuration of js buffers

;;; Commentary:
;; eslint configuration is in custom_hooks.el file

;;; Code:
(defun my-js-mode-hook ()
  "Javascript config."
  (defvar preferred-javascript-indent-level 2)
  (setq mode-name "JS2")
  
  (add-hook 'js2-mode-hook 'company-mode)
  ;; set this in all c-based programming modes
  ;; makes switch statements indent properly
  ;; (add-hook 'js2-mode-hook
  ;;           (lambda ()
  ;;             (c-set-offset 'case-label '+)))
   (setq-default
   js2-highlight-level 3
   js-indent-level preferred-javascript-indent-level
   js-switch-indent-offset preferred-javascript-indent-level ;; improve indentation
   js2-bounce-indent-p t
   js2-mode-show-strict-warnings nil)   ;; turn off js2-mode warnings
  (js2-imenu-extras-setup)
  (flycheck-mode 1))


(provide 'my_js)
;;; my_js.el ends here

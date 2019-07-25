;;; my_elm --- configuracion para edicion de elm
;;; Commentary:

;; take a look at: http://www.lambdacat.com/post-modern-emacs-setup-for-elm/

;;; Code
(add-hook 'elm-mode-hook
          (lambda ()
            (setq company-backends '(company-elm))))
(add-hook 'elm-mode-hook #'elm-oracle-setup-completion)


(provide 'my_elm)
;;; my_elm ends here

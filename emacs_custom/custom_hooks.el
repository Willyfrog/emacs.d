;; funcion propia para convertir a 4 espacios

(defun my-php-mode-hook ()
  "My PHP mode configuration.  http://stackoverflow.com/questions/12254982/emacs-php-indentation ."
  (setq indent-tabs-mode nil
        tab-width 4
        c-default-style "linux"
        c-basic-offset 4)
  (setq case-fold-search t)
  ;;(setq fill-column 78)
  ;;(c-set-offset 'arglist-cont 0)
  ;;(c-set-offset 'arglist-intro '+)
  (set (make-local-variable 'compile-command)
       (format "phpcs --report=emacs --standard=PSR2 %s"
               (buffer-file-name)))
  ;(require 'flyphpcs)
  (setq fly/phpcs-phpcs-dir "/usr/bin")
  (setq fly/phpcs-phpcs-phpinc "/usr/include/php")
  (setq fly/phpcs-phpexe "/usr/bin/php")
  (setq fly/phpcs-standard "PSR2")
  (c-set-offset 'case-label 4)
  (setq fill-column 120)
  (fci-mode 1))
  ;;(c-set-offset 'arglist-close 0))

(require 'rainbow-delimiters)

(defun my-lispy-common-config ()
  (rainbow-delimiters-mode 1)
  )

(defun my-common-lisp-mode-hook ()
  "Common lisp configuration."
  ;;(setq inferior-lisp-program "rlwrap sbcl")
  (setq inferior-lisp-program "sbcl")
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
  (require 'slime)
  (slime-setup)
  ;(paredit-mode)
  (fci-mode 1)
  (my-lispy-common-config))

(defun my-python-mode-hook ()
  "Python configuration."
  ;; (jedi:setup)
  ;; (setq jedi:server-args
  ;;     '("--log" "python-epc.log"
  ;;       "--log-level" "DEBUG"))
  ;; (setq jedi:setup-keys t)
  ;; (setq jedi:complete-on-dot t)
  (setq py-shell-switch-buffers-on-execute-p t)
  (setq py-switch-buffers-on-execute-p t)
  (setq py-split-windows-on-execute-p nil)
  (setq py-smart-indentation t)
  (setq fill-column 80)
  (fci-mode 1))


;; hooks para cargar cosas extra con los modes
(add-hook 'python-mode-hook 'my-python-mode-hook)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'php-mode-hook 'my-php-mode-hook)
(add-hook 'hy-mode-hook 'my-lispy-common-config)
(add-hook 'emacs-lisp-mode-hook 'my-lispy-common-config)
(add-hook 'lisp-mode-hook 'my-common-lisp-mode-hook)
(add-hook 'scheme-mode 'my-lispy-common-config)
(add-hook 'quack-mode 'my-lispy-common-config)


(provide 'custom_hooks)

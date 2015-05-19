;; funcion propia para convertir a 4 espacios

;; php lint
(defun php-lint-file ()
  "Lint php files."
       (interactive)
       (compile (format "php -l %s" (buffer-file-name))))
;; end of php lint

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
  ;; (setq fly/phpcs-phpcs-dir "/usr/share/pear/PHP/CodeSniffer")
  ;; (setq fly/phpcs-phpcs-phpinc "/usr/include/php")
  ;; (setq fly/phpcs-phpexe "/usr/bin/php")
  ;; (setq fly/phpcs-standard "PSR2")
  (setq flycheck-phpcs-standard "PSR2")
  (c-set-offset 'case-label 4)
  (flycheck-mode 1)
  ;(flymake-mode-on)
  ;(auto-complete-mode t)
  ;(setq fill-column 120)
  ;(fci-mode 1)
  )

(require 'rainbow-delimiters)

(defun my-lispy-common-config ()
  (rainbow-delimiters-mode 1))

(defun my-common-lisp-mode-hook ()
  "Common lisp configuration."
  ;;(setq inferior-lisp-program "rlwrap sbcl")
  (setq inferior-lisp-program "sbcl")
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
  (require 'slime)
  (slime-setup)
  ;(paredit-mode)
  ;(fci-mode 1)
  (my-lispy-common-config))

; eliminamos el highlight-indentation-mode de la lista a cargar
;(setq elpy-default-minor-modes '(eldoc-mode flymake-mode yas-minor-mode auto-complete-mode))
(defun my-python-mode-hook ()
  "Python configuration."
  ;; (jedi:setup)
  ;; (setq jedi:server-args
  ;;     '("--log" "python-epc.log"
  ;;       "--log-level" "DEBUG"))
  ;; (setq jedi:setup-keys t)
  ;; (setq jedi:complete-on-dot t)
  (if pyvenv-virtual-env
      (message "should load elpy");(elpy-enable)
    (message "no virtualenv is loaded, use pyvenv-workon and enable elpy"))
  (setq py-shell-switch-buffers-on-execute-p t)
  (setq py-switch-buffers-on-execute-p t)
  (setq py-split-windows-on-execute-p nil)
  (setq py-smart-indentation t)
  (setq fill-column 80))

(defun my-js-mode-hook ()
  "Javascript config"
  (defvar preferred-javascript-indent-level 2)
  (setq mode-name "JS2")
  (setq js2-highlight-level 3)
  (setq-default
   js2-basic-offset preferred-javascript-indent-level
   js2-bounce-indent-p nil)
  (js2-imenu-extras-setup)
  (flycheck-mode 1))

(defun my-clojure-mode-hook ()
  ;; cider
  (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
  (setq cider-repl-pop-to-buffer-on-connect t)
  (setq cider-popup-stacktraces t)
  (setq cider-repl-popup-stacktraces t)
  (setq cider-auto-select-error-buffer t)
  (setq cider-repl-history-file "~/.emacs.d/cider-history")
  (setq cider-repl-wrap-history t)
  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
  (my-lispy-common-config))

;; hooks para cargar cosas extra con los modes
(add-hook 'python-mode-hook 'my-python-mode-hook)
(add-hook 'clojure-mode-hook 'my-lispy-common-config)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'nrepl-mode-hook 'my-lispy-common-config)
(add-hook 'php-mode-hook 'my-php-mode-hook)
(add-hook 'hy-mode-hook 'my-lispy-common-config)
(add-hook 'emacs-lisp-mode-hook 'my-lispy-common-config)
(add-hook 'lisp-mode-hook 'my-common-lisp-mode-hook)
(add-hook 'scheme-mode 'my-lispy-common-config)
(add-hook 'quack-mode 'my-lispy-common-config)
(add-hook 'js2-mode-hook 'my-js-mode-hook)

(provide 'custom_hooks)
;;; custom_hooks.el ends here
 

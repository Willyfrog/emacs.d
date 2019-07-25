;;; custom_hooks --- Summary
;; custom code for adding hooks
;;; Commentary:
;;; Code
;; funcion propia para convertir a 4 espacios

;; php lint
(defun php-lint-file ()
  "Lint php files."
       (interactive)
       (compile (format "php -l %s" (buffer-file-name))))
;; end of php lint


;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint
                        josn-jsonlist)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(defun my-php-mode-hook ()
  "My PHP mode configuration.  http://stackoverflow.com/questions/12254982/emacs-php-indentation ."
  (setq indent-tabs-mode nil
        tab-width 4
        ;c-default-style "linux"
        ;c-basic-offset 4
        )
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
  ;(c-set-offset 'case-label 4)
  (flycheck-mode 1)
  ;(flymake-mode-on)
  ;(auto-complete-mode t)
  ;(setq fill-column 120)
  ;(fci-mode 1)
  )

(require 'rainbow-delimiters)

(defun my-lispy-common-config ()
  (rainbow-delimiters-mode 1))

;; Automatically load paredit when editing a lisp file
;; More at http://www.emacswiki.org/emacs/ParEdit
;;(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)


;; (defun my-common-lisp-mode-hook ()
;;   "Common lisp configuration."
;;   ;;(setq inferior-lisp-program "rlwrap sbcl")
;;   (setq inferior-lisp-program "sbcl")
;;   (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")
;;   (require 'slime)
;;   (slime-setup)
;;   ;(paredit-mode)
;;   ;(fci-mode 1)
;;   (my-lispy-common-config))

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
  ;; (if pyvenv-virtual-env
  ;;     (message "should load elpy");(elpy-enable)
  ;;   (message "no virtualenv is loaded, use pyvenv-workon and enable elpy"))
  (setq py-shell-switch-buffers-on-execute-p t)
  (setq py-switch-buffers-on-execute-p t)
  (setq py-split-windows-on-execute-p nil)
  (setq py-smart-indentation t)
  (setq fill-column 80))

(require 'my_js)

(require 'my_clojure)
;; (defun my-clojure-mode-hook ()
;;   (require 'clojure-mode-extra-font-locking)
;;   ;; cider
;;   (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;;   (setq cider-repl-pop-to-buffer-on-connect t)
;;   (setq cider-popup-stacktraces t)
;;   (setq cider-repl-popup-stacktraces t)
;;   (setq cider-auto-select-error-buffer t)
;;   (setq cider-repl-history-file "~/.emacs.d/cider-history")
;;   (setq cider-repl-wrap-history t)
;;   (add-hook 'cider-repl-mode-hook 'subword-mode)
;;   ;(add-hook 'cider-repl-mode-hook 'paredit-mode)
;;   (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
;;   (my-lispy-common-config))

(require 'my_go)
;; (require 'my_scheme)
(require 'my_elm)

(require 'my_kotlin)
;; hooks para cargar cosas extra con los modes
(add-hook 'python-mode-hook 'my-python-mode-hook)
;(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'nrepl-mode-hook 'my-lispy-common-config)
;(add-hook 'php-mode-hook 'my-php-mode-hook)
(add-hook 'hy-mode-hook 'my-lispy-common-config)
(add-hook 'emacs-lisp-mode-hook 'my-lispy-common-config)
(add-hook 'lisp-mode-hook 'my-common-lisp-mode-hook)
(add-hook 'scheme-mode 'my-scheme-mode-hook)
;;(add-hook 'quack-mode 'my-lispy-common-config)
(add-hook 'js2-mode-hook 'my-js-mode-hook)
(add-hook 'go-mode-hook 'my-go-mode-hook)
(add-hook 'elixir-mode-hook 'alchemist-mode)

(provide 'custom_hooks)
;;; custom_hooks.el ends here
 

;;; package --- Summary
;;
;; .emacs de Guillermo Vayá Pérez guivaya@gmail.com @Willyfrog_
;;
;;; Commentary: 
;;
;; This config file can be copied and modified. 
;; No need to ask for permission or mention author.
;;

;; augment recursivity
(setq max-lisp-eval-depth 12000)

;;; Code:
(add-to-list 'load-suffixes ".el.gpg") ;; allow for encrypted .el files
(add-to-list 'load-path "~/emacs.d/emacs_custom/")
(add-to-list 'load-path "~/emacs.d/hy-mode")
(require 'hy-mode)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/el-get/elpa")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;; synch packages
(setq my-el-get-packages  
      (append  
       '(auto-complete 
         autopair
         clojure-mode
         cl-lib
	 cider
         deferred
         fill-column-indicator
         js3-mode
         json
         magit
         paredit
         php-mode
         pkgbuild-mode
         popup
         rst-mode
         smart-operator
         smarty-mode
         twittering-mode
         virtualenv
         web-mode
         yasnippet
         yasnippet-config
         )))

(el-get 'sync my-el-get-packages) ;; descomentar para instalar
(el-get 'sync)

;; non el-get
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; org-mode
;(require 'org-install)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
;(require 'ox-reveal) ;; for org-reveal

;smart-mode-line
;(setq sml/theme 'dark)
;(sml/setup)
;power-line
(require 'powerline)
(powerline-default-theme)

;; apply some configuration for Mac OS X only
(if (string-equal system-type "darwin")
    (progn 

      ;; option -> alt & command -> meta
      (setq mac-option-modifier nil
            mac-command-modifier 'meta
            x-select-enable-clipboard t)

      ;; Setup PATH in darwin
      (setenv "PATH" (shell-command-to-string "source ~/.bash_profile; echo -n $PATH"))
      ;; Update exec-path with the contents of $PATH
      (loop for path in (split-string (getenv "PATH") ":") do 
            (add-to-list 'exec-path path))

      ;; Grab other environment variables
      (loop for var in (split-string (shell-command-to-string "source ~/.bash_profile; env")) do
            (let* ((pair (split-string var "="))
                   (key (car pair))
                   (value (cadr pair)))
              (unless (getenv key)
                (setenv key value))))
      ))

;;No tool bar mode
(tool-bar-mode -1)
;;No menu bar mode
(menu-bar-mode -1)
;;IDO
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;Parentesis
(show-paren-mode 1)
(setq show-paren-delay 0)
(display-battery-mode t)
(setq inhibit-startup-message t)

(require 'php-mode)

;; set major modes
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.rst\\'" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.hy\\'" . hy-mode))
;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\emacs\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.el\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lsp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))

;; flycheck
;;(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'custom_hooks)

(setq-default indent-tabs-mode nil) ;; usa espacios en vez de tabuladores
(setq tab-width 4)          ;; 4 espacios por tab

;; probamos la carga de autocompletado
(require 'auto-complete)
(global-auto-complete-mode t)

;(autoload 'jedi:setup "jedi" nil t)

(setq twittering-use-master-password t)

;; habilitar acentos
(require 'iso-transl)
(put 'scroll-left 'disabled nil)

;; shift+direction moves to that window
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

;; make buffernames unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; 
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;; php lint
(defun php-lint-file ()
  "Lint php files."
       (interactive)
       (compile (format "php -l %s" (buffer-file-name))))
;; end of php lint

;; yasnippets
;;(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

;; para que fci este a 80
;;(setq-default fill-column 80)

;; linea para marcar el ancho que debería mantener
(require 'fill-column-indicator)
(setq fci-rule-color "darkblue")
; better load on hook load with (fci-mode 1)
;(define-globalized-minor-mode
;  global-fci-mode fci-mode (lambda () (fci-mode 1)))
;(global-fci-mode t)

;; custom info files
(add-to-list 'Info-default-directory-list "~/emacs.d/info")

;; my custom functions

(require 'kill_project_buffers)
(require 'start_gtalk)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Anonymous Pro" :foundry "unknown" :slant normal :weight normal :height 113 :width normal)))))


(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups"))))

;; custom key-bindings
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; theme is the last thing to load, so if something breaks in the config, 
;; everything will be white telling me that something went wrong
(add-to-list 'custom-theme-load-path "~/emacs.d/themes")
(load-theme 'deeper-blue-mine t)


(provide 'emacs)
;;; emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((virtualenv-default-directory . "~/Proyectos/gigas_api") (virtualenv-workon . "api")))))

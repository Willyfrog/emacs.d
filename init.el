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
;(add-to-list 'load-path "~/emacs.d/hy-mode")
;(require 'hy-mode)

;(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
;(add-to-list 'load-path "~/.emacs.d/el-get/elpa")
(add-to-list 'load-path "~/Proyectos/interrupt.el")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (let (el-get-master-branch)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp))))

;; synch packages
;; (setq my-el-get-packages
;;       (append
;;        '(auto-complete
;;          autopair
;;          clojure-mode
;;          cl-lib
;; 	 cider
;;          deferred
;;          fill-column-indicator
;;          json
;;          magit
;;          paredit
;;          php-mode
;;          pkgbuild-mode
;;          popup
;;          rst-mode
;;          smart-operator
;;          smarty-mode
;;          twittering-mode
;;          web-mode
;;          yasnippet
;;          yasnippet-config
;;          )))

;(el-get 'sync my-el-get-packages) ;; descomentar para instalar
;(el-get 'sync)

;; non el-get
(require 'package)

;; gnu es necesario para emacs < 24
;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; org-mode
;(require 'org-install)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done t)
;(require 'ox-reveal) ;; for org-reveal
;(require 'ox-md) ;; allow for exporting to Markdown

;; apply some configuration for Mac OS X only
;; (if (string-equal system-type "darwin")
;;     (progn

;;       ;; option -> alt & command -> meta
;;       (setq mac-option-modifier nil
;;             mac-command-modifier 'meta
;;             x-select-enable-clipboard t)

;;       ;; Setup PATH in darwin
;;       (setenv "PATH" (shell-command-to-string "source ~/.bash_profile; echo -n $PATH"))
;;       ;; Update exec-path with the contents of $PATH
;;       (loop for path in (split-string (getenv "PATH") ":") do
;;             (add-to-list 'exec-path path))

;;       ;; Grab other environment variables
;;       (loop for var in (split-string (shell-command-to-string "source ~/.bash_profile; env")) do
;;             (let* ((pair (split-string var "="))
;;                    (key (car pair))
;;                    (value (cadr pair)))
;;               (unless (getenv key)
;;                 (setenv key value))))
;;       ))

;;No tool bar mode
(tool-bar-mode -1)
;;No menu bar mode
;(menu-bar-mode -1)
;;No scrollbar
(scroll-bar-mode -1)
(display-battery-mode t)
(setq inhibit-startup-message t)

;;IDO
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(ido-vertical-mode t)

;;Parentesis
(show-paren-mode t)
(setq show-paren-style 'expression)
(setq show-paren-delay 0)

;(require 'php-mode)

;; set major modes
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.rst\\'" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-mode))
;(add-to-list 'auto-mode-alist '("\\.hy\\'" . hy-mode))
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
;(require 'auto-complete)
;(global-auto-complete-mode t)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;(setq twittering-use-master-password t)

;; habilitar acentos
(require 'iso-transl)
(put 'scroll-left 'disabled nil)

;; shift+direction moves to that window
;; (when (fboundp 'windmove-default-keybindings)
;;       (windmove-default-keybindings))

;; make buffernames unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;; yasnippets
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)


(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; para que fci este a 80
;;(setq-default fill-column 80)

;; linea para marcar el ancho que debería mantener
;;(require 'fill-column-indicator)
;;(setq fci-rule-color "darkblue")
; better load on hook load with (fci-mode 1)
;(define-globalized-minor-mode
;  global-fci-mode fci-mode (lambda () (fci-mode 1)))
;(global-fci-mode t)

;; custom info files
(add-to-list 'Info-default-directory-list "~/emacs.d/info")

;; my custom functions

(require 'kill_project_buffers)
(require 'start_gtalk)

(require 'interrupt)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Meslo LG S DZ" :foundry "bitstream" :slant normal :weight normal :height 128 :width normal)))))


(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups"))))

; enable projectile for all
(projectile-global-mode)

; ace jump mode
(autoload 'ace-jump-mode "ace-jump-mode")

;; switch-window
(require 'switch-window)
(setq switch-window-shortcut-style 'alphabet)

;;; CUSTOM KEY-BINDINGS
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<mouse-8>") 'next-buffer)
(global-set-key (kbd "<mouse-9>") 'previous-buffer)
;;
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
;; ido mode para M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; old M-x.
;; ace-jump
(global-set-key (kbd "C-c C-s") 'ace-jump-mode)

; expand region with C-=
(global-set-key (kbd "C-=") 'er/expand-region)

; switch window
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-O") 'other-frame)
(global-set-key (kbd "C-c o") 'switch-to-minibuffer)
(global-set-key (kbd "C-x o") 'switch-window)

; smart parens key bindings
(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)
(define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
(define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
(define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
(define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)


(define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-<right>") 'sp-backward-barf-sexp)

(global-set-key (kbd "<f12>") 'interrupt)
(global-set-key (kbd "S-<f12>") 'interrupt-end)

;; (define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

; diminish modes to reduce clutter
;; (eval-after-load "projectile-mode" '(diminish 'projectile-mode "Pro"))
;; (eval-after-load "yas-minor-mode" '(diminish 'yas-minor-mode "+"))
;; (eval-after-load "abbrev-mode" '(diminish 'abbrev-mode "ab."))

; wanderlust config
;; (autoload 'wl "wl" "Wanderlust" t)
;; (autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
;; (autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)


;; IMAP
;; (setq elmo-imap4-default-server "imap.gmail.com")
;; (setq elmo-imap4-default-user "guillermo.vaya@gigas.com")
;; (setq elmo-imap4-default-authenticate-type 'clear)
;; (setq elmo-imap4-default-port '993)
;; (setq elmo-imap4-default-stream-type 'ssl)

;; (setq elmo-imap4-use-modified-utf7 t)

;; SMTP
;; (setq wl-smtp-connection-type 'starttls)
;; (setq wl-smtp-posting-port 587)
;; (setq wl-smtp-authenticate-type "plain")
;; (setq wl-smtp-posting-user "guillermo.vaya")
;; (setq wl-smtp-posting-server "smtp.gmail.com")
;; (setq wl-local-domain "gigas.com")

;; (setq wl-default-folder "%inbox")
;; (setq wl-default-spec "%")
;; (setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
;; (setq wl-trash-folder "%[Gmail]/Trash")

;; (setq wl-folder-check-async t)

;; (setq elmo-imap4-use-modified-utf7 t)

;; (autoload 'wl-user-agent-compose "wl-draft" nil t)
;; (if (boundp 'mail-user-agent)
;;     (setq mail-user-agent 'wl-user-agent))
;; (if (fboundp 'define-mail-user-agent)
;;     (define-mail-user-agent
;;       'wl-user-agent
;;       'wl-user-agent-compose
;;       'wl-draft-send
;;       'wl-draft-kill
;;       'mail-send-hook))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "208ace27fe9ce44edc36ed0f1b6149d389b6276827ad309b54d93a529d4cfb33" "df817d33ddab9ef51a69b05bcf464a9c8719dde1e5e669bb3c6719884e7ae34e" "d401b0920023533c5de1553d27e9d4669ae088f771cf2736108870f783af0cc0" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "cdf488af2fbc0735c3eeff42e77bc62cb14bd869a89c6a27a854e2c4a50c9ad2" "9bae7be09c7eba31130778f79b25ab5dc0fcf2af30588a7400343d99da3186e4" "10de032bf7ffb90f4d3ee9888c0dd1aa65549c00e5a6e22b5d606b0bbb1354ce" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "9b4f4a04c1770e7062bca28ab1a82f58c0ee18c4be74a98a85502fa7acf5bc89" "e80a0a5e1b304eb92c58d0398464cd30ccbc3622425b6ff01eea80e44ea5130e" "427234e4b45350b4159575f1ac72860c32dce79bb57a29a196b9cfb9dd3554d9" "5dfacaf380068d9ed06e0872a066a305ab6a1217f25c3457b640e76c98ae20e6" "99aae8e9489f7117284238c1cb0a1136147161e4c007c579bf28418603d96a5c" default)))
 '(display-battery-mode t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(fringe-mode 4 nil (fringe))
 '(main-line-separator-style (quote chamfer))
 '(menu-bar-mode nil)
 '(org-agenda-files (quote ("~/org/todo.org")))
 '(safe-local-variable-values
   (quote
    ((virtualenv-default-directory . "~/Proyectos/hylink")
     (virtualenv-workon . "hylink")
     (virtualenv-default-directory . "~/Proyectos/gigas_api")
     (virtualenv-workon . "api"))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

;; theme is the last thing to load, so if something breaks in the config,
;; everything will be white telling me that something went wrong
(add-to-list 'custom-theme-load-path "~/emacs.d/themes")
;;(load-theme 'deeper-blue-mine t)
;;(load-theme 'sanityinc-solarized-light t)
(load-theme 'leuven t)
;; cargamos moe-theme
;; (require 'moe-theme)
;; ;; Resize titles
;; (setq moe-theme-resize-markdown-title '(2.0 1.7 1.5 1.3 1.0 1.0))
;; (setq moe-theme-resize-org-title '(2.2 1.8 1.6 1.4 1.2 1.0 1.0 1.0 1.0))
;; (setq moe-theme-resize-rst-title '(2.0 1.7 1.5 1.3 1.1 1.0))
;; (moe-light)

;smart-mode-line
(setq sml/theme 'light)
(sml/setup)
(global-pretty-mode t)

;; open todo tasks
(find-file (expand-file-name "~/Dropbox/org/todo.org"))

(provide 'emacs)
;;; emacs ends here

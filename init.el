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

;;;; Paths

(add-to-list 'load-suffixes ".el.gpg") ;; allow for encrypted .el files
(add-to-list 'load-path "~/.emacs.d/emacs_custom/")
;;; add to the path anything that comes from homebrew
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

;;;; OLD REQUIRES

;(add-to-list 'load-path "~/emacs.d/hy-mode")
;(require 'hy-mode)
;(add-to-list 'load-path "~/Proyectos/interrupt.el")

;;;; PACKAGE MANAGEMENT

;; non el-get
(require 'package)

;; gnu es necesario para emacs < 24
;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;;; PLATFORM CONFIGURATION

;; make env
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  ;(exec-path-from-shell-copy-env "GOPATH")
  (exec-path-from-shell-copy-env "WORKON_HOME"))


;; prevent ctrl-Z from hiding the window
(global-set-key (kbd "C-z") nil)

;; accented
(require 'iso-transl)
(put 'scroll-left 'disabled nil)

;;;; PACKAGE CONFIGURATION

;; magit
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log-head)

;; org mode
(require 'my_org)

;; helm
(require 'my_helm)

;;Parenthesis
(show-paren-mode t)
(setq show-paren-style 'expression)
(setq show-paren-delay 0)

;; probamos la carga de autocompletado
;(require 'auto-complete)
;(global-auto-complete-mode t)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

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


;;; VISUALS
;;No tool bar mode
(tool-bar-mode -1)
;;No menu bar mode
;(menu-bar-mode -1)
;;No scrollbar
(scroll-bar-mode -1)
(display-battery-mode t)
(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil) ;; usa espacios en vez de tabuladores
(setq tab-width 4)          ;; 4 espacios por tab

;;;; FILE ASSOCIATION

;; set major modes
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.rst\\'" . rst-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-mode))
;(add-to-list 'auto-mode-alist '("\\.hy\\'" . hy-mode))
(add-to-list 'auto-mode-alist '("\\emacs\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.el\\'" . emacs-lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lisp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.lsp\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?$" . js2-jsx-mode))
;(require 'alchemist)
;(add-to-list 'auto-mode-alist '("\\.ex?\\'" . alchemist-mode))

;; hooks
(require 'custom_hooks)


;(setq twittering-use-master-password t)


;; shift+direction moves to that window
;; (when (fboundp 'windmove-default-keybindings)
;;       (windmove-default-keybindings))


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
; (require 'start_gtalk)

; (require 'interrupt)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry nil :slant normal :weight normal :height 130 :width normal)))))


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
;(global-set-key (kbd "M-x") 'smex)
;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; basic extended mode
;; ace-jump
;; (global-set-key (kbd "C-c C-s") 'ace-jump-mode)
;; avy
(global-set-key (kbd "M-s a") 'avy-goto-char)
(global-set-key (kbd "M-s o") 'helm-swoop)

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
(define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
(define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)


(define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-<right>") 'sp-backward-barf-sexp)

;(global-set-key (kbd "<f12>") 'interrupt)
;(global-set-key (kbd "S-<f12>") 'interrupt-end)

;; multicursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; hideshow
(global-set-key (kbd "M-i") 'hs-toggle-hiding)
(global-set-key (kbd "s-i") 'hs-hide-all)
(global-set-key (kbd "s-I") 'hs-show-all)

;; (define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)

; diminish modes to reduce clutter
;; (eval-after-load "projectile-mode" '(diminish 'projectile-mode "Pro"))
;; (eval-after-load "yas-minor-mode" '(diminish 'yas-minor-mode "+"))
;; (eval-after-load "abbrev-mode" '(diminish 'abbrev-mode "ab."))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(ansi-term-color-vector
   [unspecified "#FAFAFA" "#D50000" "#66BB6A" "#FFA000" "#42A5F5" "#7E57C2" "#0097A7" "#546E7A"])
 '(cider-inject-dependencies-at-jack-in nil)
 '(coffee-tab-width 4)
 '(custom-safe-themes
   (quote
    ("b7b2cd8c45e18e28a14145573e84320795f5385895132a646ff779a141bbda7e" "8b313e1793da427e90c034dbe74f3ad9092ac291846c0f855908c42a6bda1ff4" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "cf205b711e61963020e2d1561e87cdbe7727679b58af25dcabfe5073572b16f0" "90e4b4a339776e635a78d398118cb782c87810cb384f1d1223da82b612338046" "70f5a47eb08fe7a4ccb88e2550d377ce085fedce81cf30c56e3077f95a2909f2" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "4dd1b115bc46c0f998e4526a3b546985ebd35685de09bc4c84297971c822750e" "629d9ba6189ae9b42bb8d49ee57d23e6ea7cc697f1593c17ecf78bba38a65459" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3fd36152f5be7e701856c3d817356f78a4b1f4aefbbe8bbdd1ecbfa557b50006" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "208ace27fe9ce44edc36ed0f1b6149d389b6276827ad309b54d93a529d4cfb33" "df817d33ddab9ef51a69b05bcf464a9c8719dde1e5e669bb3c6719884e7ae34e" "d401b0920023533c5de1553d27e9d4669ae088f771cf2736108870f783af0cc0" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "cdf488af2fbc0735c3eeff42e77bc62cb14bd869a89c6a27a854e2c4a50c9ad2" "9bae7be09c7eba31130778f79b25ab5dc0fcf2af30588a7400343d99da3186e4" "10de032bf7ffb90f4d3ee9888c0dd1aa65549c00e5a6e22b5d606b0bbb1354ce" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "9b4f4a04c1770e7062bca28ab1a82f58c0ee18c4be74a98a85502fa7acf5bc89" "e80a0a5e1b304eb92c58d0398464cd30ccbc3622425b6ff01eea80e44ea5130e" "427234e4b45350b4159575f1ac72860c32dce79bb57a29a196b9cfb9dd3554d9" "5dfacaf380068d9ed06e0872a066a305ab6a1217f25c3457b640e76c98ae20e6" "99aae8e9489f7117284238c1cb0a1136147161e4c007c579bf28418603d96a5c" default)))
 '(display-battery-mode t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(evil-emacs-state-cursor (quote ("#D50000" bar)))
 '(evil-insert-state-cursor (quote ("#D50000" hbar)))
 '(evil-normal-state-cursor (quote ("#FFA000" box)))
 '(evil-visual-state-cursor (quote ("#66BB6A" box)))
 '(exec-path-from-shell-check-startup-files nil)
 '(highlight-symbol-colors
   (quote
    ("#FFA000" "#66BB6A" "#0097A7" "#42A5F5" "#7E57C2" "#D84315")))
 '(highlight-symbol-foreground-color "#546E7A")
 '(highlight-tail-colors
   (if
       (eq variant
           (quote light))
       (quote
        (("#FF5722" . 0)
         ("#FFA000" . 10)
         ("#FFD600" . 30)
         ("#f2f2f2" . 60)
         ("#FAFAFA" . 80)))
     (quote
      (("#F8BBD0" . 0)
       ("#EC407A" . 10)
       ("#B388FF" . 30)
       ("#f2f2f2" . 60)
       ("#FAFAFA" . 80)))))
 '(linum-format " %6d ")
 '(menu-bar-mode nil)
 '(ns-right-alternate-modifier (quote none))
 '(package-selected-packages
   (quote
    (nodejs-repl nvm expand-region csv-mode rjsx-mode clj-refactor yaml-mode web-mode swoop switch-window smartparens rainbow-delimiters pretty-mode paredit ox-ioslide ox-gfm org-bullets multiple-cursors markdown-mode magit helm-swoop helm-projectile flycheck-clojure exec-path-from-shell company clojure-snippets clojure-mode-extra-font-locking cljdoc avy ansible-doc ansible ag)))
 '(show-paren-mode t)
 '(tabbar-background-color "#ffffff")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))

;; mail configuration
;; (require 'my-mail) ;; not used anymore

;; sudo make me a sandwich
(require 'sandwich)

;; theme is the last thing to load, so if something breaks in the config,
;; everything will be white telling me that something went wrong
(add-to-list 'custom-theme-load-path "~/emacs.d/themes")
;;(load-theme 'deeper-blue-mine t)
;;(load-theme 'sanityinc-solarized-light t)
;;(load-theme 'spacemacs-light t)
(load-theme 'tsdh-light t)
;;(require 'org-beautify-theme) ;; extra pretty for org-mode but after theme
;; cargamos moe-theme
;; (require 'moe-theme)
;; ;; Resize titles
;; (setq moe-theme-resize-markdown-title '(2.0 1.7 1.5 1.3 1.0 1.0))
;; (setq moe-theme-resize-org-title '(2.2 1.8 1.6 1.4 1.2 1.0 1.0 1.0 1.0))
;; (setq moe-theme-resize-rst-title '(2.0 1.7 1.5 1.3 1.1 1.0))
;; (moe-light)

;smart-mode-line
;; (setq sml/theme 'light)
;; (sml/setup)
; (global-pretty-mode t)


;; open todo tasks
(find-file (expand-file-name "~/Dropbox/org/todo.org"))

(provide 'init)
;;; init.el ends here

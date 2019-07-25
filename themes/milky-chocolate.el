(deftheme milky-chocolate "DOCSTRING for milky-chocolate")
  (custom-theme-set-faces 'milky-chocolate
   '(default ((t (:foreground "#3c2301" :background "#fffdb4" ))))
   '(cursor ((t (:background "#000000" ))))
   '(fringe ((t (:background "#eef0f0" ))))
   '(mode-line ((t (:foreground "#ffb551" :background "#401700" ))))
   '(region ((t (:background "#dd7717" ))))
   '(secondary-selection ((t (:background "#c3925b" ))))
   '(font-lock-builtin-face ((t (:foreground "#578124" ))))
   '(font-lock-comment-face ((t (:foreground "#7d827d" ))))
   '(font-lock-function-name-face ((t (:foreground "#4f603c" ))))
   '(font-lock-keyword-face ((t (:foreground "#625c15" ))))
   '(font-lock-string-face ((t (:foreground "#760059" ))))
   '(font-lock-type-face ((t (:foreground "#1c1105" ))))
   '(font-lock-constant-face ((t (:foreground "#631505" ))))
   '(font-lock-variable-name-face ((t (:foreground "#8b1b03" ))))
   '(minibuffer-prompt ((t (:foreground "#814d24" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
   )

;;;###autoload
;; (and load-file-name
;;     (boundp 'custom-theme-load-path)
;;     (add-to-list 'custom-theme-load-path
;;                  (file-name-as-directory
;;                   (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'milky-chocolate)

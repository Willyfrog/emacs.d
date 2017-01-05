;; org-mode
;(require 'org-install)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-directory (file-name-as-directory "~/Dropbox/org"))
(setq org-work-directory (file-name-as-directory "~/org"))
(setq org-log-done t)
(setq org-agenda-files (list (concat org-directory "todo.org")
                             (concat org-work-directory "todo.org")))
(setq diary-file (concat org-directory "diary"))
(setq org-agenda-include-diary t)
(setq org-default-notes-file (concat org-directory "notas/varios.org"))
(setq org-catch-invisible-edits 'smart) ;; 

;;; remove unwanted holidays
(setq holiday-bahai-holidays nil)
(setq holiday-hebrew-holidays nil)
(setq holiday-islamic-holidays nil)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))) ;; use bullets instead of asterisks
;(require 'ox-reveal) ;; for org-reveal
;(require 'ox-md) ;; allow for exporting to Markdown


(provide 'my_org)

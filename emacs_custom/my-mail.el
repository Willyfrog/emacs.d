;;; my-mail --- Provide my configuration to use with mu4e
;;; author: Guillermo Vayá <guivaya@gmail.com>
;;; Commentary:
;;; although is for my own config, it can be useful for others with the need of multi-gmail accounts


;;; Code:
(require 'mu4e)

;; default
(setq mu4e-maildir (expand-file-name "~/.Mail"))
(setq mu4e-sent-folder   "/guivaya/[Gmail].Sent Mail")
(setq mu4e-drafts-folder "/guivaya/[Gmail].Drafts")
(setq mu4e-trash-folder  "/guivaya/[Gmail].Trash")


(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

;; ask for account when composing mail
(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(defvar my-mu4e-account-alist
  '(("private"
     (user-mail-address  "guivaya@gmail.com")
     (user-full-name     "Guillermo Vayá Pérez")
     (mu4e-sent-folder   "/guivaya/[Gmail].Sent Mail")
     (mu4e-drafts-folder "/guivaya/[Gmail].Drafts")
     (mu4e-trash-folder  "/guivaya/[Gmail].Trash")
     ;; (mu4e-refile-folder "/guivaya/[Gmail]/Archive")
     )
    ("work"
     (user-mail-address  "guillermo.vaya@ticketea.com")
     (mu4e-sent-folder   "/ticketea/[Gmail].Enviados")
     (mu4e-drafts-folder "/ticketea/[Gmail].Borradores")
     (mu4e-trash-folder  "/ticketea/[Gmail].Papelera")
     ;; (mu4e-refile-folder "/ticketea/Archives")
     )))

(setq mu4e-user-mail-address-list
      (mapcar (lambda (account) (cadr (assq 'user-mail-address account)))
              my-mu4e-account-alist))

;; don't save message to Sent Messages, GMail/IMAP will take care of this
(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
      '(("/guivaya/INBOX"             . ?i)
        ("/guivaya/[Gmail].Enviados" . ?s)
        ("/ticketea/INBOX"     . ?t)))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; something about ourselves
;; I don't use a signature...
(setq
 user-mail-address "guivaya@gmail.com"
 user-full-name  "Guillermo Vayá"
 ;; message-signature
 ;;  (concat
 ;;    "Foo X. Bar\n"
 ;;    "http://www.example.com\n")
)

;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu, 'gnutls' in Archlinux.

(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials
      (expand-file-name "~/.authinfo.gpg")
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

;; Viewing inline images
(setq mu4e-view-show-images t)
;; Use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
   (imagemagick-register-types))

(provide 'my-mail)
;;; my-mail.el ends here

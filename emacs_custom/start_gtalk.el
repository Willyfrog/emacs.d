;; config de gtalk que carga el fichero con los passwords

;;(setq jabber-alert-message-hooks (quote (jabber-message-libnotify jabber-message-echo jabber-message-scroll)))
(setq jabber-alert-presence-hooks nil)

(add-to-list 'load-path "~/emacs.d/encrypted")

;; set status in 
(setq jabber-mode-line-mode t)
(setq jabber-auto-reconnect t)
(setq jabber-vcard-avatars-retrieve nil)
(setq jabber-history-enabled t)
(setq jabber-roster-line-format " %c %-25n %u %-8s (%r)") ;oculta el avatar
(setq jabber-show-offline-contacts nil)
(setq jabber-chat-buffer-show-avatar nil)

(defun start-gtalk ()
  (interactive)
  (require 'gtalk)
  (setq jabber-account-list  `(("guillermo.vaya@gigas.com" 
                                (:network-server . "talk.google.com") 
                                (:port . 5223) 
                                (:connection-type . ssl) 
                                (:password . ,gtalk-password-gigas)) 
                               ("guivaya@gmail.com" 
                                (:network-server . "talk.google.com") 
                                (:port . 5223)
                                (:connection-type . ssl)
                                (:password . ,gtalk-password-guivaya))))
  (jabber-connect-all))

(provide 'start_gtalk)

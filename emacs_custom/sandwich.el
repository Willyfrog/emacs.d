;;; sandwich --- I keep opening a system/configuration file but forget to open as superuser
;; related: https://xkcd.com/149/
;;; Code:
(defun sudo-make-me-a-sandwich ()
  (interactive)
  (find-file (concatenate 'string  "/sudo::" (buffer-file-name))))

;; TODO: drop the old buffer so only the sudoed one stays, good enough for now
;; TODO: make it work with remote files too

(provide 'sandwich)
;;; sandwich.el ends here

;;; package --- Summary
;;
;;  Custom functions for emacs
;;
;;; Commentary:
;;  Some of this functions may be duplicated in other/better libraries
;;  They are mostly for learning purposes
;;  Although I called it PROJECT-BUFFERS it only checks for the path
;;  to contain some words.
;; 
;;; License:
;;  Copyright (C) 2013 Guillermo Vayá Pérez
;; Permission is hereby granted, free of charge, to any person obtaining a copy 
;; of this software and associated documentation files (the "Software"), to deal 
;; in the Software without restriction, including without limitation the rights 
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
;; copies of the Software, and to permit persons to whom the Software is 
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in 
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
;; IN THE SOFTWARE.

;; Some custom Emacs functions

;;; Code:
(require 'cl)
(defun filter-buffers-by-file-name (partial-path)
  "Return list of buffers which contain PARTIAL-PATH in its filename."
  (remove-if (lambda (x) (or (null (buffer-file-name x))
                          (null (string-match partial-path (buffer-file-name x))))) (buffer-list)))

(defun kill-project-buffers (partial-path)
  "Kill all buffers which contain PARTIAL-PATH."
  (interactive "sPartial name:")
  (let ((kill-list (filter-buffers-by-file-name partial-path)))
    (if (null kill-list)
        (message (format "No buffers matched '%s'" partial-path))
      (if (y-or-n-p (format "Killing %d buffers.  Continue? " (length kill-list)))
        (mapcar 'kill-buffer  kill-list)
        (message "User cancelled")))))

(defun reset-project-buffers (partial-path)
  "Reverts all buffers which contain PARTIAL-PATH."
  (interactive "sPartial name:")
  (let ((revert-list (filter-buffers-by-file-name partial-path)))
    (if (null revert-list)
        (message (format "No buffers matched '%s'" partial-path))
      (if (y-or-n-p (format "Revert %d buffers? " (length revert-list)))
          (progn
            (dolist (buff revert-list)
              (with-current-buffer buff
                (revert-buffer t t t)))
            (message (format "Reverted %d buffers." (length revert-list))))
        (message "User cancelled")))))

(provide 'kill_project_buffers)
;;; kill_project_buffers ends here

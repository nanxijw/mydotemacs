(let ((org (locate-user-emacs-file "start.org"))
      (el  (locate-user-emacs-file "start.el")))
  (when (file-newer-than-file-p org el)
    (require 'org)
    (org-babel-tangle-file org)))

;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
;(push (expand-file-name "lisp" user-emacs-directory) load-path)

;; Every file opened and loaded by Emacs will run through this list to
;; check for a proper handler for the file, but during startup, it
;; won’t need any of them.
(let ((file-name-handler-alist nil))
  ;; load configs
  (load-file (locate-user-emacs-file "start.el")))

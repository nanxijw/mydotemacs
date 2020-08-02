(require 'org)
(let ((org (locate-user-emacs-file "start.org"))
      (el  (locate-user-emacs-file "start.el")))
  (when (file-newer-than-file-p org el)
    (org-babel-tangle-file org)))

;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
;(push (expand-file-name "lisp" user-emacs-directory) load-path)

;(require 'start)
(load-file (locate-user-emacs-file "start.el"))

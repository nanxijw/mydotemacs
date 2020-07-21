(require 'org)
;;(setq user-emacs-directory "~/emacs.d.org")
(let ((org (locate-user-emacs-file "lisp/start.org"))
      (el  (locate-user-emacs-file "lisp/start.el")))
  (when (file-newer-than-file-p org el)
    (org-babel-tangle-file org)))

;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
(push (expand-file-name "site-lisp" user-emacs-directory) load-path)
(push (expand-file-name "lisp" user-emacs-directory) load-path)

(require 'start)

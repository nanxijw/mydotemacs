;;; packages.el --- my-defaults layer funcs file for Spacemacs.
;; This file is not part of GNU Emacs.

;;; Code:

(defun sexp-beginning-position (&optional n)
  "Return the character position of the first character on the current sexp."
  (interactive "P")
  (let ((region (bounds-of-thing-at-point 'sexp)))
    (if (not region)
        (scan-sexps (point) -1)
      (car region))))

(defun sexp-end-position (&optional n)
  "Return the character position of the first character on the current sexp."
  (interactive "P")
  (let ((region (bounds-of-thing-at-point 'sexp)))
    (if (not region)
        (point)
      (cdr region))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-end-position)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a sexp instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (sexp-beginning-position)
           (sexp-end-position)))))

(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key (kbd "M-k") 'qiang-copy-line)

;;; funcs.el ends here

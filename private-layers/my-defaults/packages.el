;;; packages.el --- my-defaults layer packages file for Spacemacs.
;; This file is not part of GNU Emacs.

;;; Code:

(defconst my-defaults-packages
  '(highlight-symbol))

(defun my-defaults/init-highlight-symbol ()
  (use-package highlight-symbol
    :defer t
    :bind (("C-<f3>" . highlight-symbol-at-point)
           ("<f3>" . highlight-symbol-next)
           ("S-<f3>" . highlight-symbol-prev)
           ("C-S-<f3>" . highlight-symbol-remove-all))))

;;; packages.el ends here

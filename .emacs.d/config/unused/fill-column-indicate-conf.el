;;----------------------------------------------------------------------------
;; Fill column indicator
;;----------------------------------------------------------------------------
(setq default-fill-column 80)
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(setq fci-rule-color "red")
(dolist (x '(c c++ emacs-lisp))
  (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'fci-mode))

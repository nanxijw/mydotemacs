;;----------------------------------------------------------------------------
;; Fill column indicator
;;----------------------------------------------------------------------------
(setq default-fill-column 80)
(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
(setq fci-rule-color "red")

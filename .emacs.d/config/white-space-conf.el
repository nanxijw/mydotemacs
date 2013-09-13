;;; show white spaces
(global-whitespace-mode t)
;(setq whitespace-style '(face space tabs trailing lines-tail newline empty tab-mark newline-mark space-mark)
;(setq whitespace-style '(face space tabs trailing lines-tail empty tab-mark space-mark))
(setq whitespace-style '(face tabs trailing tab-mark))
(setq whitespace-display-mappings
      '((space-mark 32 [32] [183] [46]) ; modified, do not show dot
        (space-mark 160 [164] [95])
        (space-mark 2208 [2212] [95])
        (space-mark 2336 [2340] [95])
        (space-mark 3616 [3620] [95])
        (space-mark 3872 [3876] [95])
        (newline-mark 10 [182 10] [36 10]) ; modified, show another character instead $
        (tab-mark 9 [187 9] [92 9])))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  ;;'(whitespace-indentation ((t (:foreground "#073642"))))
  '(whitespace-tab ((t (:background "#073642" :foreground "#a07f41"))))
  '(whitespace-trailing ((t (:background "#2a6181" :foreground "#a07f41")))))

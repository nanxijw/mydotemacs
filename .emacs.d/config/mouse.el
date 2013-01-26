;; scroll 3 line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; 3 line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; 按住ctrl，可用鼠标拖拽屏幕
(require 'mouse-drag)
(global-set-key (kbd "<C-down-mouse-1>") 'mouse-drag-drag)
;;页面平滑滚动， scroll-margin 3 靠近屏幕边沿3行时开始滚动，可以很好的看到上下文。
(setq scroll-margin 3)

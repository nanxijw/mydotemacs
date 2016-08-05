(setq-default
 create-lockfiles nil
 truncate-lines t
 ;; set frame title to show current buffer path
 frame-title-format "%b    %f"
 ) ;; end of setq-default

(prefer-coding-system 'chinese-gbk-dos)
(delete-selection-mode t)
(show-paren-mode t)
(blink-cursor-mode t)
(electric-indent-mode -1)

;; scroll 3 line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; 3 line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;;页面平滑滚动， scroll-margin 3 靠近屏幕边沿3行时开始滚动，可以很好的看到上下文。
(setq scroll-margin 3)

;; sql option
(setq sql-mysql-options '("-C" "-f" "-n" "-t"))

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq tab-width 4 indent-tabs-mode nil);; four space instead one tab
            (c-set-style "stroustrup")))

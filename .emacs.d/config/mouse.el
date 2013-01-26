;; scroll 3 line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; 3 line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; ��סctrl�����������ק��Ļ
(require 'mouse-drag)
(global-set-key (kbd "<C-down-mouse-1>") 'mouse-drag-drag)
;;ҳ��ƽ�������� scroll-margin 3 ������Ļ����3��ʱ��ʼ���������ԺܺõĿ��������ġ�
(setq scroll-margin 3)

;; Default Emacs Live bindings
(setq w32-lwindow-modifier 'super) ;; 设置win键为super键
(setq w32-rwindow-modifier 'super) ;; 设置win键为super键
;;允许使用C-z作为命令前缀
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
;; 快捷键设定
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; 用ibuffer替换list buffer

;; taglist
(global-set-key [(f8)] 'taglist)
;; org-capture
(define-key global-map [(f6)] 'org-capture)

;; multiple-cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; ace-jump
(define-key global-map (kbd "C-z SPC") 'ace-jump-mode)

;;diff shortcuts
(global-set-key (kbd "C-c d f") 'diff-buffer-with-file)

;;browse kill ring (visual paste)
(global-set-key (kbd "C-M-y") 'browse-kill-ring)
;;make ^h delete rather than help
(global-set-key (kbd "C-h") 'delete-backward-char)

;; highlight-symbol
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)
(global-set-key [(control meta f3)] 'highlight-symbol-query-replace)
(global-set-key [(control shift f3)] 'highlight-symbol-remove-all)

;; 设置emacs的透明度
(global-set-key [(f12)] 'loop-alpha)  ;;注意这行中的F12 , 可以改成你想要的按键
(setq alpha-list '((70 100) (100 100)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list)))
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))))

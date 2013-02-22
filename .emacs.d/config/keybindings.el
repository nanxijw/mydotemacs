;; Default Emacs Live bindings
(setq w32-lwindow-modifier 'super) ;; ����win��Ϊsuper��
(setq w32-rwindow-modifier 'super) ;; ����win��Ϊsuper��
;;����ʹ��C-z��Ϊ����ǰ׺
(define-prefix-command 'ctl-z-map)
(global-set-key (kbd "C-z") 'ctl-z-map)
;; ��ݼ��趨
(global-set-key (kbd "C-x C-b") 'ibuffer) ;; ��ibuffer�滻list buffer

;; taglist
(global-set-key [(f8)] 'taglist)
;; org-capture
(define-key global-map [(f6)] 'org-capture)

;; multiple-cursors
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
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
(global-set-key (kbd "M-y") 'browse-kill-ring)
;;make ^h delete rather than help
(global-set-key (kbd "C-h") 'delete-backward-char)

;; highlight-symbol
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)
(global-set-key [(control meta f3)] 'highlight-symbol-query-replace)
(global-set-key [(control shift f3)] 'highlight-symbol-remove-all)
;;;; helm
;;(global-set-key (kbd "C-z h") 'helm-mini)

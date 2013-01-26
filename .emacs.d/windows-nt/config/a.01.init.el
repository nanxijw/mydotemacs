(add-to-list 'load-path (concat my-emacs-config-dir "windows-nt/plugin"))
;; ���ñ�������ʾ�ļ�������·����
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
;; ���÷�����ģʽ
(server-start)
;;����0.5����Զ���� ��windows�£�
(run-with-idle-timer 0.5 nil 'w32-send-sys-command 61488)

;; ��kill-ring��ϵͳ������ֿ�(Windows);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq interprogram-cut-function nil)
(setq interprogram-paste-function nil)
(defun paste-from-pasteboard ()
  (interactive)
  (and mark-active (filter-buffer-substring (region-beginning) (region-end) t))
  (insert (w32-get-clipboard-data))
  )
(defun copy-to-pasteboard (p1 p2)
  (interactive "r*")
  (w32-set-clipboard-data (buffer-substring p1 p2))
  (message "Copied selection to clipboard")
  )
(defun cut-to-pasteboard (p1 p2)
  (interactive "r*")
  (w32-set-clipboard-data (filter-buffer-substring p1 p2 t)))

;;ϵͳ�������ݼ���C-z C-c���ƣ�C-z C-vճ����
(global-set-key (kbd "s-v") 'paste-from-pasteboard)
(global-set-key (kbd "s-c") 'copy-to-pasteboard)
(global-set-key (kbd "s-x") 'cut-to-pasteboard)
(global-set-key "\C-z\C-c" 'copy-to-pasteboard)
(global-set-key "\C-z\C-v" 'paste-from-pasteboard)
(global-set-key "\C-z\C-x" 'cut-to-pasteboard)
(global-set-key [(mouse-3)] 'paste-from-pasteboard);; ����м�ճ��

;; ���ý��̵�Ĭ�ϱ��뷽ʽΪgbk
(setq default-process-coding-system '(gbk . gbk))

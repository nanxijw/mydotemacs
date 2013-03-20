(add-to-list 'load-path (concat my-emacs-config-dir "windows-nt/plugin"))
;; 设置标题栏显示文件的完整路径名
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
;; 启用服务器模式
(server-start)
;;启动0.5秒后自动最大化 （windows下）
(run-with-idle-timer 0.5 nil 'w32-send-sys-command 61488)

;; 把kill-ring和系统剪贴板分开(Windows);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq interprogram-cut-function 'w32-set-clipboard-data)
(setq interprogram-cut-function '(lambda (text)
                                   (let ((clipboard-text (w32-get-clipboard-data)))
                                     (when clipboard-text
                                       (setq x-last-selected-text clipboard-text))
                                     (w32-set-clipboard-data text))))
;; (setq interprogram-paste-function nil)
(defun paste-from-pasteboard ()
  (interactive)
  (and mark-active (filter-buffer-substring (region-beginning) (region-end) t))
  (let ((text (w32-get-clipboard-data)))
    (when text
      (setq x-last-selected-text text))
    (insert x-last-selected-text)))

(defun copy-to-pasteboard (p1 p2)
  (interactive "r*")
  (w32-set-clipboard-data (buffer-substring p1 p2))
  (message "Copied selection to clipboard")
  )
(defun cut-to-pasteboard (p1 p2)
  (interactive "r*")
  (w32-set-clipboard-data (filter-buffer-substring p1 p2 t)))

;;系统剪贴板快捷键（C-z C-c复制，C-z C-v粘贴）
(global-set-key (kbd "s-v") 'paste-from-pasteboard)
(global-set-key (kbd "s-c") 'copy-to-pasteboard)
(global-set-key (kbd "s-x") 'cut-to-pasteboard)
(global-set-key "\C-z\C-c" 'copy-to-pasteboard)
(global-set-key "\C-z\C-v" 'paste-from-pasteboard)
(global-set-key "\C-z\C-x" 'cut-to-pasteboard)
(global-set-key [(mouse-3)] 'paste-from-pasteboard);; 鼠标中键粘贴

;; 设置进程的默认编码方式为gbk
;; 会导致tramp输入密码无法被识别，屏蔽
;; (setq default-process-coding-system '(gbk . gbk))

;; 设置环境变量
(setenv "PATH" (concat "e:/programs/gnuwin32/bin;" (getenv "PATH")))
(setq exec-path (cons "e:/programs/gnuwin32/bin/" exec-path))

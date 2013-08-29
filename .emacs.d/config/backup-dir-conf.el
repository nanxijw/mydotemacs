(setq auto-save-file-name-transforms `((".*" ,(concat my-tmp-dir "autosaves\\1") t)))
(setq auto-save-list-file-name (concat my-tmp-dir "/autosave-list"))

(setq backup-by-copying t) ;; 使用复件备份方式
(setq backup-directory-alist `((".*" . ,my-backups-dir))) ;; 设置备份路径

;; 设置一下备份时的版本控制，这样更加安全。
(setq version-control     t ;; 启用版本控制，即可以备份多次
      kept-new-versions   6 ;; 保留最新的6个版本
      kept-old-versions   2 ;; 备份最原始的两个版本，即第一次编辑前的文档，和第二次编辑前的文档
      delete-old-versions t ;; 删除中间版本
      )

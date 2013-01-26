(setq
 my-tmp-dir      (file-name-as-directory (concat my-emacs-config-dir "tmp"))
 my-etc-dir      (file-name-as-directory (concat my-emacs-config-dir "etc"))
 my-lib-dir      (file-name-as-directory (concat my-emacs-config-dir "lib"))
 my-autosaves-dir (file-name-as-directory (concat my-tmp-dir  "autosaves"))
 my-backups-dir  (file-name-as-directory (concat my-tmp-dir  "backups")))

(add-to-list 'load-path my-lib-dir)

(defun add-pack-lib (p)
  "Adds the path (specified relative to the the pack's lib dir)
  to the load-path"
  (add-to-list 'load-path (concat my-lib-dir p)))

(add-pack-lib "myplugin")

(custom-set-variables
 '(case-fold-search nil);; 搜索区分大小写
 '(indicate-empty-lines t)
 '(make-backup-files nil)
 '(inhibit-startup-message t)
 '(show-paren-mode t)
 '(delete-selection-mode t)
 '(indent-tabs-mode nil)
 '(global-hl-line-mode t)
 )

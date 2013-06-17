(setq
 my-tmp-dir      (file-name-as-directory (concat my-emacs-config-dir "tmp"))
 my-etc-dir      (file-name-as-directory (concat my-emacs-config-dir "etc"))
 my-lib-dir      (file-name-as-directory (concat my-emacs-config-dir "lib"))
 my-autosaves-dir (file-name-as-directory (concat my-tmp-dir  "autosaves"))
 my-backups-dir  (file-name-as-directory (concat my-tmp-dir  "backups")))

(defun add-pack-lib (p)
  "Adds the path (specified relative to the the pack's lib dir)
  to the load-path"
  (add-to-list 'load-path (concat my-lib-dir p)))

(add-to-list 'load-path my-lib-dir)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-pack-lib "myplugin")

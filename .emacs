;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; set config dir
(setq my-emacs-config-dir "~/.emacs.d/")

;; load all init files
(mapc 'load (directory-files (concat my-emacs-config-dir "config") t "\\.el$"))

;; windows
(when (eq 'windows-nt system-type)
  (mapc 'load (directory-files (concat my-emacs-config-dir "windows-nt/config") t "\\.el$"))
)
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search nil)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(delete-selection-mode t)
 '(global-hl-line-mode t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :height 98 :width normal :foundry "outline" :family "Consolas")))))

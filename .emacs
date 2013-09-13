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
  (mapc 'load (directory-files (concat my-emacs-config-dir "windows-nt/config") t "\\.el$")))
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search nil)
 '(column-number-mode t)
 '(delete-selection-mode t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(show-paren-mode t))

(set-default-font "Consolas 10")
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font t
;;                     charset
;;                     (font-spec :family "Microsoft Yahei" :size 14)))

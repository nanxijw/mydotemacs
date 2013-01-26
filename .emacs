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

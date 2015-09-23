(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ;;("marmalade" . "https://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.org/packages/")))
  ;; 禁止elpa自动初始化packages
  (setq package-enable-at-startup nil)
  ;; 手动初始化之
  (package-initialize))

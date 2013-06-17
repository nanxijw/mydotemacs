(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;禁止elpa自动加载packages
(setq package-enable-at-startup nil)
;手动初始化之
;(package-initialize)

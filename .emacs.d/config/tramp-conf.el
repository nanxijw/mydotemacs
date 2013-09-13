;; 远程访问
(require 'tramp)
(cond
 ((eq system-type 'windows-nt)
  (setq tramp-default-method "plink"))
 ((eq system-type 'gnu/linux)
  (setq tramp-default-method "ssh")))
;; 指定默认用户名
;(setq tramp-default-user "cc")
(setq password-cache-expiry 36000)

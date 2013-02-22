;; set my name and email
(setq user-full-name "jiangw")
(setq user-mail-address "nanxijw@gmail.com")
;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])
;; 默认输入法为仓颉
(setq default-input-method "chinese-cns-tsangchi")
;;自动识别.list文件
 (setq auto-mode-alist
       (append '(("\\.list$" . conf-mode)) auto-mode-alist))
(defalias 'yes-or-no-p 'y-or-n-p)

;; make fringe smaller
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;;use file path to ensure buffer name uniqueness
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")
;; highlight-symbol
(require 'highlight-symbol)
;; color-moccur
(require 'color-moccur)
;; ;; helm
;; (add-pack-lib "helm")
;; (require 'helm-config)
;;;;太慢，屏蔽之 (helm-mode 1)

;;配色
(add-pack-lib "color-theme")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-molokai)))

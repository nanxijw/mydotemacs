;; set my name and email
(setq user-full-name "jiangw")
(setq user-mail-address "nanxijw@gmail.com")
;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])
(setq default-input-method "chinese-cns-tsangchi")
(defalias 'yes-or-no-p 'y-or-n-p)
;; make fringe smaller
(if (fboundp 'fringe-mode)
    (fringe-mode 4))
;; (mouse-avoidance-mode 'animate)
;; recursive minibuffer。
(setq enable-recursive-minibuffers t)
;; 设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;; enlarge the kill ring
(setq kill-ring-max 200)
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
;; use solarized color theme
(load-theme 'solarized-dark t)

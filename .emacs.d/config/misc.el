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

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)

;; 可以递归的使用 minibuffer。
(setq enable-recursive-minibuffers t)

;; 设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 用一个很大的 kill ring. 防止不小心删掉重要的东西。
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

(load-theme 'solarized-dark t)

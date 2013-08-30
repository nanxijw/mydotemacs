;; set my name and email
(setq user-full-name "jiangw")
(setq user-mail-address "nanxijw@gmail.com")
;; ����������ʾ���� calendar ���� pC ��ʾ����
(setq chinese-calendar-celestial-stem
["��" "��" "��" "��" "��" "��" "��" "��" "��" "��"])
(setq chinese-calendar-terrestrial-branch
      ["��" "��" "��" "î" "��" "��" "��" "δ" "��" "��" "��" "��"])
;; Ĭ�����뷨Ϊ���
(setq default-input-method "chinese-cns-tsangchi")
;;�Զ�ʶ��.list�ļ�
 (setq auto-mode-alist
       (append '(("\\.list$" . conf-mode)) auto-mode-alist))
(defalias 'yes-or-no-p 'y-or-n-p)

;; make fringe smaller
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; ��꿿�����ָ��ʱ�������ָ���Զ��ÿ�����ס���ߡ�
(mouse-avoidance-mode 'animate)

;; ���Եݹ��ʹ�� minibuffer��
(setq enable-recursive-minibuffers t)

;; ���� sentence-end ����ʶ�����ı�㡣������ fill ʱ�ھ�ź�� �������ո�
(setq sentence-end "\\([������]\\|����\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; ��һ���ܴ�� kill ring. ��ֹ��С��ɾ����Ҫ�Ķ�����
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

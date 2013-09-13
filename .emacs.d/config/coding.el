;; �ҵ�C/C++���Ա༭����
(defun my-c-mode-common-hook()
  ;; insert spaces instead of tabs, and each tab will, be inserted
  ;; with 4 spaces instead
  (setq tab-width 4 indent-tabs-mode nil)
  ;;;; hungry-delete and auto-newline
  ;; (c-toggle-auto-hungry-state 1)
  (c-set-style "stroustrup")
  (gtags-mode 1))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; remove all trailing whitespace and trailing blank lines before
;; saving the file
(add-hook 'before-save-hook 'whitespace-cleanup)

;; dos batch file
(setq auto-mode-alist
      (append
       (list (cons "\\.[bB][aA][tT]$" 'dos-mode))
       ;; For DOS init files
       (list (cons "CONFIG\\."   'dos-mode))
       (list (cons "AUTOEXEC\\." 'dos-mode))
       auto-mode-alist))

  (autoload 'dos-mode "dos"
     "Edit Dos scripts." t)

;; taglist
(require 'taglist)

;; paredit
;; (autoload 'enable-paredit-mode "paredit"
;;   "Turn on pseudo-structural editing of Lisp code."
;;   t)
;; (dolist (x '(scheme emacs-lisp lisp))
;;   (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'enable-paredit-mode))

;; ;; rainbow-delimiters
;; (require 'rainbow-delimiters)
;; (dolist (x '(scheme emacs-lisp lisp))
;;   (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'rainbow-delimiters-mode))

;; ;; ������ߵ����ţ��ͻ��Զ���ȫ�ұߵĲ���.����(), "", [] , {} , �ȵȡ�
;; (defun my-common-mode-auto-pair ()
;; (interactive)
;; (make-local-variable 'skeleton-pair-alist)
;; (setq skeleton-pair-alist  '(
;; ;;(? ? _ "''")
;; (? ? _ """")
;; (? ?  _ "()")
;; (? ?  _ "[]")
;; (? ?  _ "{}")
;; ;(?{ \n > _ \n ?} >)
;; ))
;; (setq skeleton-pair t)
;; (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;; (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;; ;(local-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
;; (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
;; (dolist (x '(c c++))
;;   (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'my-common-mode-auto-pair))
;; (require 'paredit)
;; (dolist (x '(emacs-lisp lisp scheme))
;;   (add-hook (intern (concat (symbol-name x) "-mode-hook")) 'enable-paredit-mode))

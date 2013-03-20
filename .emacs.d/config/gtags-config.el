;; gtags
(autoload 'gtags-mode "gtags" "" t) ;; ÆôÓÃgnu globalÄ£Ê½
;; disable default key map
(setq gtags-suggested-key-mapping nil)

(defun gtags-find (arg)
  (interactive "P")
  (if (null arg) (gtags-find-tag) (gtags-find-rtag)))
;; keymap set

(add-hook 'gtags-mode-hook
  '(lambda ()
     (define-key gtags-mode-map "\e*" 'gtags-pop-stack)
     (define-key gtags-mode-map "\e." 'gtags-find)
     (define-key gtags-mode-map "\C-x4." 'gtags-find-tag-other-window)
))

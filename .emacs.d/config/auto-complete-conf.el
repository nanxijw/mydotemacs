(require 'popup)
(require 'fuzzy)
;;auto-complete mode
(add-pack-lib "auto-complete")
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)
(add-to-list 'ac-dictionary-directories (concat my-lib-dir "auto-complete/dict"))

(setq ac-delay 0.5)
(setq ac-auto-show-menu t)
(setq ac-dwim nil)
(setq ac-use-menu-map t)
(setq ac-use-quick-help nil)
(setq ac-show-menu-immediately-on-auto-complete nil)
(setq ac-auto-start 2)
(setq ac-expaned-on-auto-complete nil)
(setq ac-candidate-menu-min 0)
(setq ac-ignore-case nil)

;;----------------------------------------------------------------------------
;; Use Emacs' built-in TAB completion hooks to trigger AC (Emacs >= 23.2)
;;----------------------------------------------------------------------------
;; (setq tab-always-indent 'complete) ;; use 't when auto-complete is disabled
;; (add-to-list 'completion-styles 'initials t)
;; ;;hook AC into completion-at-point
;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))
;;(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
;;               ac-source-semantic
               ac-source-yasnippet))

(dolist (mode '(html-mode sh-mode smarty-mode lisp-mode cc-mode pike-mode))
  (add-to-list 'ac-modes mode))

;;;;Key triggers
;; (define-key ac-completing-map (kbd "C-M-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-M-p") 'ac-previous)
(define-key ac-completing-map [tab] 'ac-complete) ;; 默认设置ac-expand，很讨厌，设置成ac-complete才是想要的结果
(define-key ac-completing-map (kbd "M-RET") 'ac-help)
(define-key ac-completing-map "\r" 'ac-complete)
;; (ac-set-trigger-key "TAB")

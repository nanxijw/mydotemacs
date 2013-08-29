(require 'popup)
(require 'fuzzy)
;;auto-complete mode
(add-pack-lib "auto-complete")
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(ac-flyspell-workaround)
(add-to-list 'ac-dictionary-directories (concat my-lib-dir "auto-complete/dict"))

(global-auto-complete-mode t)
(setq ac-auto-show-menu t)
(setq ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed
(setq ac-use-menu-map t)
(setq ac-use-quick-help nil)
(setq ac-disable-inline t)
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-auto-start 2)
(setq ac-expand-on-auto-complete nil)
(setq ac-candidate-menu-min 0)
(setq ac-ignore-case nil)

;;----------------------------------------------------------------------------
;; Use Emacs' built-in TAB completion hooks to trigger AC (Emacs >= 23.2)
;;----------------------------------------------------------------------------
(setq tab-always-indent 'complete) ;; use 't when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)
;; hook AC into completion-at-point
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(set-default 'ac-sources
             '(ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
;;               ac-source-semantic
               ac-source-yasnippet))

;; (dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
;;                 sass-mode yaml-mode csv-mode espresso-mode haskell-mode
;;                 html-mode nxml-mode sh-mode smarty-mode clojure-mode
;;                 lisp-mode textile-mode markdown-mode tuareg-mode))
;;   (add-to-list 'ac-modes mode))


;;;;Key triggers
;; (define-key ac-completing-map (kbd "C-M-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-M-p") 'ac-previous)
(define-key ac-completing-map [tab] 'ac-complete) ;; 默认设置ack-expand，很讨厌，设置成ac-complete才是想要的结果
(define-key ac-completing-map (kbd "M-RET") 'ac-help)
(define-key ac-completing-map "\r" 'nil)
;;(ac-set-trigger-key "TAB")

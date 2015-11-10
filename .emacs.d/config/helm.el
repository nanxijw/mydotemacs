(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-x C-f") 'helm-find-files) ;; use helm-find-files rather then find-file
(global-set-key (kbd "M-x") 'helm-M-x) ;; use helm-M-x replace M-x
(global-set-key (kbd "C-x b") 'helm-mini) ;; use helm-mini replace switch-buffer
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring) ;; use helm to show kill ring

;; helm-mode key map
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persisitent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)

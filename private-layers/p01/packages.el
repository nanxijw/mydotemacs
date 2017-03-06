;;; packages.el --- p01 layer packages file for Spacemacs.
;; This file is not part of GNU Emacs.

;;; Code:

(defconst p01-packages
  '((server-res-text :location local)
    (pike-mode       :location built-in)
    (conf-mode       :location built-in)))

(defun p01/init-server-res-text ()
  (use-package server-res-text
    :commands (p01/id-text-at-point p01/resmake)))

(defun p01/init-pike-mode ()
  (use-package pike-mode
    :defer t
    :mode "/server_scripts/.+\\.[ch]$"
    :init
    (progn
      (add-hook 'pike-mode-hook
                '(lambda ()
                   (set (make-local-variable 'imenu-generic-expression)
                        (list
                         (list nil "^\\<[^()\n]*[^[:alnum:]_:<>~]\\([[:alpha:]_][[:alnum:]_:<>~]*\\)\\([     \n]\\|\\\\\n\\)*(\\([   \n]\\|\\\\\n\\)*\\([^   \n(*][^()]*\\(([^()]*)[^()]*\\)*\\)?)\\([   \n]\\|\\\\\n\\)*[^  \n;(]" 1)))

                   (define-key pike-mode-map [(f2)]
                     'p01/id-text-at-point)))

      ;; pike-mode don't use auto-indent when paste text
      (add-to-list 'spacemacs-indent-sensitive-modes 'pike-mode)
      ;; set pike-mode can use helm-gtags
      (when (configuration-layer/layer-usedp 'gtags)
        (spacemacs/helm-gtags-define-keys-for-mode 'pike-mode))
      (when (configuration-layer/package-usedp 'yasnippet)
        (use-package calendar
          :commands calendar-month-name)))))

(defun p01/post-init-conf-mode ()
  (use-package conf-mode
    :defer t
    :mode "\\.list$"))

;;; packages.el ends here

(defvar taglist-mode-hook nil)

(defvar taglist-keywords
  (list (list "^\\([0-9]+\\) *\\(.*\\)$" 1 font-lock-comment-delimiter-face)
        (list "^\\([0-9]+\\) *\\(.*\\)$" 2 font-lock-function-name-face)))

(defvar taglist-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "RET") 'taglist-jump)
    (define-key map (kbd "q") 'taglist-quit)
    (define-key map [(double-mouse-1)] 'taglist-jump)
    map))

(defvar taglist-window nil)
(defvar taglist-current 0)
(defvar taglist-source-buffer nil)

(defun taglist nil
  (interactive)
  (require 'speedbar)
  (require 'imenu)

  (if (string-equal (buffer-name) "*etags list*")
        (taglist-kill)

    ;; Clear cache
    (setq imenu--index-alist nil)

    ;; get source-buffer
    (setq taglist-source-buffer (current-buffer))
    (let ((current-line (line-number-at-pos)))

      ;; Create a buffer
      (if (get-buffer "*etags tmp*")
          (kill-buffer "*etags tmp*"))
      (if (get-buffer "*etags list*")
          (kill-buffer "*etags list*"))
      (set-buffer (get-buffer-create "*etags list*"))

      ;; Call speedbar tags
      (setq taglist-current 0)
      (taglist-fill-tags
       (cddr (speedbar-fetch-dynamic-tags
              (buffer-file-name taglist-source-buffer)))
       ""
       current-line)

      (goto-char (point-min))
      (forward-line (1- taglist-current))

      (setq taglist-window (split-window-horizontally))
      (set-window-buffer taglist-window "*etags list*")
      (select-window taglist-window)
      ;; (sort-fields 2 (point-min) (point-max))
      (window-resize taglist-window (- 35 (window-total-size taglist-window t)) t)
      (toggle-read-only)
      (taglist-mode))))

(defun taglist-fill-tags (tags prefix current)
  (while tags
    (if (integer-or-marker-p (cdar tags))
        (let ((tag-line
               (with-current-buffer taglist-source-buffer
                 (line-number-at-pos (cdar tags)))))
          (insert (format "%-5d%s%s\n"
                          tag-line
                          prefix
                          (caar tags)))
          (when (>= current tag-line)
            (setq taglist-current
                  (1+ taglist-current))))
      (let* ((dir-string (caar tags))
             (marker (get-text-property 0 'org-imenu-marker dir-string))
             (tag-line 0))
        (if marker
          (setq tag-line
                (with-current-buffer taglist-source-buffer
                  (line-number-at-pos marker))))
        (insert (format "%-5d%s%s\n"
                        tag-line
                        prefix
                        (caar tags)))
        (when (>= current tag-line)
          (setq taglist-current
                (1+ taglist-current)))
        (taglist-fill-tags (cdar tags)
                           (concat "+-" prefix)
                           current)))
    (setq tags (cdr tags))))

(defun taglist-kill nil
  (if (and taglist-window
           (window-live-p taglist-window)
           (not (one-window-p)))
      (delete-window taglist-window))
  (setq taglist-window nil)
  (kill-buffer "*etags list*"))

(defun taglist-jump nil
  (interactive)
  (let ((line (buffer-substring
               (line-beginning-position)
               (line-end-position))))
    (string-match "^\\([0-9]+\\)[^0-9]" line)
    (taglist-kill)
    (switch-to-buffer taglist-source-buffer)
    (goto-char (point-min))
    (forward-line (1- (string-to-number (match-string 1 line))))))

(defun taglist-quit nil
  (interactive)
  (taglist-kill))

(defun taglist-mode nil
  (interactive)
  (kill-all-local-variables)
  (use-local-map taglist-map)
  (setq major-mode 'taglist-mode)
  (setq mode-name "Tag-List")
  (setq font-lock-defaults
        (list 'taglist-keywords))
  (run-mode-hooks 'taglist-mode-hook))

(provide 'taglist)

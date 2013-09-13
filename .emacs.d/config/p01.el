(setq auto-mode-alist
       (append '(("\\.list$" . conf-mode)) auto-mode-alist))
(setq auto-mode-alist
       (append '(("/server_scripts/.+\\.[ch]$" . pike-mode)) auto-mode-alist))
;; keybind set
(add-hook 'pike-mode-hook
          '(lambda ()
             (define-key pike-mode-map [(f2)]
               'p01/id-text-at-point)))

(add-hook 'pike-mode-hook
          '(lambda ()
             (set (make-local-variable 'imenu-generic-expression)
                  (list
                   (list nil "^\\<[^()\n]*[^[:alnum:]_:<>~]\\([[:alpha:]_][[:alnum:]_:<>~]*\\)\\([     \n]\\|\\\\\n\\)*(\\([   \n]\\|\\\\\n\\)*\\([^   \n(*][^()]*\\(([^()]*)[^()]*\\)*\\)?)\\([   \n]\\|\\\\\n\\)*[^  \n;(]" 1)))))

(defvar p01/resource-text-table (make-hash-table :test 'equal))

(defun p01/resource-file-name (&optional buffer)
  "���ݵ�ǰ�ļ�·���õ�������Դ�ļ�·��"
  (unless (bufferp buffer)
    (setq buffer (current-buffer)))
  (let (prefix infix
               (suffix "server_res_text.txt")
               (path (buffer-file-name buffer)))
    (if (string-match "server_scripts/" path)
        (progn
          (setq prefix (concat
                        (substring path 0 (second (match-data)))
                        "internal_etc"))
          (cond ((string-match "/hwr/" prefix) (setq infix "/ruiqu/"))
                ((string-match "/ytl/" prefix) (setq infix "/yitaili/"))
                (t (setq infix "/")))
          (concat prefix infix suffix))
      (message "�ļ�����һ����ȷ��·���У�resmake����server_scriptsĿ¼�µ��ļ���Ч"))))

(defun p01/resource-file-content (file-name)
  "�õ���Ӧ�ļ�����"
  (unless (stringp (gethash file-name p01/resource-text-table))
    (with-temp-buffer
      (let ((coding-system-for-read (if (string-match "/yitaili/" file-name)
                                        'big5-dos 'gbk-dos)))
      (insert-file-contents file-name)
      (puthash file-name (buffer-string) p01/resource-text-table))))
  (gethash file-name p01/resource-text-table))

(defun p01/id-text-in-resource (resource-id resource-text)
  "�����ֱ���ļ��ڲ����ض�id��Ӧ������"
  (string-match (concat "^" resource-id " +\\(\".+\"\\)") resource-text)
  (match-string-no-properties 1 resource-text))

(defun p01/id-text-at-point (&optional buffer)
  "��ȡ��ǰλ��������Դ��ŵĶ�Ӧ����"
  (interactive)
  (unless (bufferp buffer)
    (setq buffer (current-buffer)))
  (let ((symbol (thing-at-point 'symbol)))
    (if (string-match "^$$\\([0-9]+\\)" symbol)
        (message "%s" (p01/id-text-in-resource (match-string-no-properties 1 symbol)
                                      (p01/resource-file-content
                                       (p01/resource-file-name buffer))))
      (message "!!!!!!����:��겻����Ч��������Դ��!!!!!!"))))

(defun resmake (&optional buffer)
  "��buffer�е�������Դ����ö�Ӧ��������Դ��������bufferδָ������Ϊ��ǰbuffer��
���ѡ����һ��region������ѡ�е�region��û��ѡ��region������ȫ��"
  (interactive)
  (unless (bufferp buffer)
    (setq buffer (current-buffer)))
  (let (beg end resource-id resource-text text
            (text (p01/resource-file-content (p01/resource-file-name buffer))))
    (if mark-active
        (progn
          (setq beg (region-beginning))
          (setq end (region-end)))
      (progn
        (setq beg (point-min))
        (setq end (point-max))))
    (goto-char end)
    ;; �滻�Ĺ����л�ı�region�ĳ��ȣ������Ҫ�Ӻ���ǰ�滻
    (while (re-search-backward "\\$\\$\\([0-9]+\\)" beg t)
      (setq end (point))
      (setq resource-text
            (save-match-data
              (setq resource-id (match-string-no-properties 1))
              (p01/id-text-in-resource resource-id text)))
      (message "%s" resource-text)
      (replace-match (replace-quote resource-text))
      (goto-char end))))

(defun p01/clear-resource-text-table ()
  (interactive)
  (clrhash p01/resource-text-table))

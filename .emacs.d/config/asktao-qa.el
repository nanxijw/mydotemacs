;; (defvar design-calc-something-need-replace
;;   '(("int" . "floor")
;;     ("��". "(")
;;     ("��" . ")")
;;     ("��" . ")")
;;     ("\\(\\w+ */ *\\w+\\)" . "(\\1)")
;;     ("RRS(\\([0-9]+\\))" . "(100 + random(\\1*2 + 1) - \\1)")))

;; (defun design-calc-translate-formula (translate-list formula)
;;   (if (eq translate-list nil)
;;       formula
;;     (design-calc-translate-formula
;;      (cdr translate-list)
;;      (replace-regexp-in-string (caar translate-list)
;;                                (cdar translate-list)
;;                                formula t))))

;; (defun design-calc-eval (formula &optional translate-list)
;;   (calc-eval (design-calc-translate-formula
;;               (append design-calc-something-need-replace translate-list)
;;               formula)))

(defun get-res-text-file (&optional buffer)
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

(defun resmake (&optional buffer)
  "��buffer�е�������Դ����ö�Ӧ��������Դ��������bufferδָ������Ϊ��ǰbuffer��
���ѡ����һ��region������ѡ�е�region��û��ѡ��region������ȫ��"
  (interactive)
  (unless (bufferp buffer)
    (setq buffer (current-buffer)))
  (let (beg end resource-id resource-text text
            (text (with-current-buffer (find-file-noselect
                                        (get-res-text-file buffer))
                    (buffer-substring-no-properties (point-min) (point-max)))))
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
              (string-match (concat "^" resource-id " +\\(\".+\"\\)") text)
              (match-string-no-properties 1 text)))
      (message "%s" resource-text)
      (replace-match (replace-quote resource-text))
      (goto-char end))))

(setq auto-save-file-name-transforms `((".*" ,(concat my-tmp-dir "autosaves\\1") t)))
(setq auto-save-list-file-name (concat my-tmp-dir "/autosave-list"))

(setq backup-by-copying t) ;; ʹ�ø������ݷ�ʽ
(setq backup-directory-alist `((".*" . ,my-backups-dir))) ;; ���ñ���·��

;; ����һ�±���ʱ�İ汾���ƣ��������Ӱ�ȫ��
(setq version-control     t ;; ���ð汾���ƣ������Ա��ݶ��
      kept-new-versions   6 ;; �������µ�6���汾
      kept-old-versions   2 ;; ������ԭʼ�������汾������һ�α༭ǰ���ĵ����͵ڶ��α༭ǰ���ĵ�
      delete-old-versions t ;; ɾ���м�汾
      )

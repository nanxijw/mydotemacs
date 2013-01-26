;; cygwin…Ë÷√
(setenv "PATH" (concat "e:/programs/cygwin/bin;" (getenv "PATH")))
(setq exec-path (cons "e:/programs/cygwin/bin/" exec-path))
(require 'cygwin-mount)
(cygwin-mount-activate)

;; ;; Replace DOS shell with Cygwin Bash Shell
(add-hook 'comint-output-filter-functions
    'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions
    'comint-watch-for-password-prompt nil t)
(setq explicit-shell-file-name "bash.exe")
;; For subprocesses invoked via the shell
;; (e.g., "shell -c command")
(setq shell-file-name explicit-shell-file-name)

;; (require 'telnet)
;; (defun telnet (host)
;;   "Open a network login connection to host named HOST (a string).
;; Communication with HOST is recorded in a buffer `*PROGRAM-HOST*'
;; where PROGRAM is the telnet program being used.  This program
;; is controlled by the contents of the global variable
;; `telnet-host-properties', falling back on the value of the
;; global variable `telnet-program'. Normally input is edited
;; in Emacs and sent a line at a time."
;;   (interactive "sOpen connection to host: ")
;;   (let* ((comint-delimiter-argument-list '(?\  ?\t))
;;          (properties (cdr (assoc host telnet-host-properties)))
;;          (telnet-program (if properties (car properties) telnet-program))
;;          (name (concat telnet-program "-" (comint-arguments host 0 nil) ))
;;          (buffer (get-buffer (concat "*" name "*")))
;;          (telnet-options (if (cdr properties)
;;                  (cons "-l" (cdr properties))))
;;          process)
;;     (if (and buffer (get-buffer-process buffer))
;;         (pop-to-buffer (concat "*" name "*"))
;;       (pop-to-buffer
;;        (apply 'make-comint name telnet-program nil telnet-options))
;;       (setq process (get-buffer-process (current-buffer)))
;;       (set-process-filter process 'telnet-initial-filter)
;;       ;;(set-process-filter process 'telnet-initial-filter)
;;       ;; Don't send the `open' cmd till telnet is ready for it.
;;       ;;(accept-process-output process)
;;       (erase-buffer)
;;       (send-string process (concat "open " host "\n"))
;;       (telnet-mode)
;;       (setq telnet-remote-echoes t)
;;       (setq telnet-new-line "\n") ;; needed for cygwin 1.3.11
;;       (setq comint-input-sender 'telnet-simple-send)
;;       (setq telnet-count telnet-initial-count)
;;       (setq comint-process-echoes nil)
;;       (setq comint-redirect-echo-input nil)
;;       (set-process-coding-system process 'gbk 'gbk)
;;       )))

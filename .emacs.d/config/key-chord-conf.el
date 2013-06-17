(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-in-macros nil)
(setq key-chord-two-keys-delay 0.05)

(key-chord-define-global "zv" "\C-y")
(key-chord-define-global "zc" 'mark-whole-buffer)
(key-chord-define-global "90"     "()\C-b")
(key-chord-define-global "()"     "()\C-b")
(key-chord-define-global "\"\"" "\"\"\C-b")
(key-chord-define-global "{}"     "{}\C-b")
(key-chord-define-global "[]"     "[]\C-b")
(key-chord-define-global "er"     "\C-m")
(key-chord-define-global "de"     'kill-line)
(key-chord-define-global "da"     '(lambda () (interactive) (kill-line 0)))
(key-chord-define-global "ds"     'kill-whole-line)

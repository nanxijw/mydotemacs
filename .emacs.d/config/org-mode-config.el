(setq org-directory "~/GTD/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
;; capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/GTD/todo.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("n" "Note" entry (file+headline "~/GTD/notes.org" "Notes")
         "* %^{Topic} %T %^g\n%?\n%i" :prepend t :empty-lines 1)
        ("j" "Journal" entry (file+datetree "~/GTD/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")))

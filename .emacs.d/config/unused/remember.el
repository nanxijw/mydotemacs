 (setq remember-annotation-functions '(org-remember-annotation))
 (setq remember-handler-functions '(org-remember-handler))
 (add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map [(f7)] 'org-remember)

(setq org-remember-templates
      '(("Todo" ?t "* TODO %? %^g\n %i\n " "~/GTD/newgtd.org" "Office")
        ("Journal" ?j "\n* %^{topic} %T \n%i%?\n" "~/GTD/journal.org")
        ("Book" ?b "\n* %^{Book Title} %t :READING: \n%[~/GTD/booktemp.txt]\n"
         "~/GTD/journal.org")
        ("Test notes" ?n "\n* %^{topic} %T \n%i%?\n" "~/GTD/testnotes.org")
        ("Contact" ?c "\n* %^{Name} :CONTACT:\n%[~/GTD/contemp.txt]\n"
         "~/GTD/privnotes.org")
      ))

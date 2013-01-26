(defvar design-calc-something-need-replace '(("int" . "floor")
                                            ("£¨". "(")
                                            ("£©" . ")")
                                            ("£¬" . ")")
                                            ("\\(\\w+ */ *\\w+\\)" . "(\\1)")
                                            ("RRS(\\([0-9]+\\))" . "(100 + random(\\1*2 + 1) - \\1)")
                                            ))

(defun design-calc-translate-formula (translate-list formula)
  (if (eq translate-list nil)
      formula
    (design-calc-translate-formula (cdr translate-list )
                                   (replace-regexp-in-string  (caar translate-list)  (cdar translate-list) formula t))))

(defun design-calc-eval (formula &optional translate-list)
    (calc-eval (design-calc-translate-formula (append design-calc-something-need-replace translate-list) formula)))

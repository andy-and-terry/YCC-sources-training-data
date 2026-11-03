(defun digit-square-sum (n)
  (loop for c across (princ-to-string (abs n))
        sum (expt (digit-char-p c) 2)))

(format t "~a~%~a~%" (digit-square-sum 123) (digit-square-sum -99))

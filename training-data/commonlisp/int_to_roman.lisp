;;; Integer (1..3999) to Roman numeral using a greedy table.
(defparameter *table*
  '((1000 . "M") (900 . "CM") (500 . "D") (400 . "CD") (100 . "C") (90 . "XC")
    (50 . "L") (40 . "XL") (10 . "X") (9 . "IX") (5 . "V") (4 . "IV") (1 . "I")))

(defun to-roman (n)
  (with-output-to-string (out)
    (loop for (value . symbol) in *table*
          do (loop while (>= n value)
                   do (write-string symbol out)
                      (decf n value)))))

(format t "~a ~a~%" (to-roman 1994) (to-roman 58))

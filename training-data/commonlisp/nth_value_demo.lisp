(defun divide (a b)
  (values (floor a b) (mod a b) (/ a b)))

(format t "quotient ~a~%" (nth-value 0 (divide 17 5)))
(format t "remainder ~a~%" (nth-value 1 (divide 17 5)))
(format t "ratio ~a~%" (nth-value 2 (divide 17 5)))

(multiple-value-call (lambda (&rest xs) (format t "all: ~a~%" xs))
  (divide 9 2)
  (values 100 200))

(multiple-value-list (floor 7 2))
(format t "~a~%" (multiple-value-list (truncate -7 2)))
(format t "~a~%" (multiple-value-list (values)))

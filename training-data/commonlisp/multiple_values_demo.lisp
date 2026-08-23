(defun divmod (a b)
  (values (floor a b) (mod a b)))

(multiple-value-bind (quotient remainder) (divmod 17 5)
  (format t "quotient: ~a remainder: ~a~%" quotient remainder))

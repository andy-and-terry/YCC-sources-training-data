(defun min-max (list)
  (values (reduce #'min list) (reduce #'max list)))

(multiple-value-bind (lo hi) (min-max '(4 9 2 7))
  (format t "~a ~a~%" lo hi))

(print (multiple-value-list (floor 7 2)))
(print (nth-value 1 (floor 7 2)))
(print (multiple-value-call #'+ (values 1 2) (values 3 4)))
(print (multiple-value-list (values)))

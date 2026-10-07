(defun safe-parse (str)
  (ignore-errors (parse-integer str)))

(print (safe-parse "42"))
(print (safe-parse "not-a-number"))

(multiple-value-bind (value condition) (safe-parse "oops")
  (format t "value: ~a, condition: ~a~%" value condition))

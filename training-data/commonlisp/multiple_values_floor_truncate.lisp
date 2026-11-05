(multiple-value-bind (q r) (floor 17 5)
  (format t "~d ~d~%" q r))
(multiple-value-bind (q r) (truncate -17 5)
  (format t "~d ~d~%" q r))

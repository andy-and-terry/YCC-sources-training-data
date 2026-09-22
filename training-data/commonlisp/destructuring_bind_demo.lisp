(defun describe-point (point)
  (destructuring-bind (x y &optional (z 0)) point
    (format t "x=~a y=~a z=~a~%" x y z)))

(destructuring-bind (first second &rest rest) '(1 2 3 4 5)
  (format t "first=~a second=~a rest=~a~%" first second rest))

(describe-point '(1 2))
(describe-point '(1 2 3))

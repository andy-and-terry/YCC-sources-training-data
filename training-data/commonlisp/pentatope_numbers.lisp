;;; n(n+1)(n+2)(n+3)/24
(defun term (n)
  (floor (((n * (n + 1)) * (n + 2)) * (n + 3)) 24))

(loop for n from 1 to 15
      do (format t "~2d -> ~d~%" n (term n)))

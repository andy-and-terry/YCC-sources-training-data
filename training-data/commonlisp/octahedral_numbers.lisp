;;; n(2n^2+1)/3
(defun term (n)
  (floor (n * (((2 * n) * n) + 1)) 3))

(loop for n from 1 to 15
      do (format t "~2d -> ~d~%" n (term n)))

;;; n^2(n+1)/2
(defun term (n)
  (floor ((n * n) * (n + 1)) 2))

(loop for n from 1 to 15
      do (format t "~2d -> ~d~%" n (term n)))

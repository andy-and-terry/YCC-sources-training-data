;;; 6n(n-1)+1
(defun term (n)
  (((6 * n) * (n - 1)) + 1))

(loop for n from 1 to 15
      do (format t "~2d -> ~d~%" n (term n)))

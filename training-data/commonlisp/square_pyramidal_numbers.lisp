;;; Square pyramidal numbers n(n+1)(2n+1)/6
(defun term (n) (floor (* (* n (+ n 1)) (+ (* 2 n) 1)) 6))

(format t "~{~a ~}~%" (loop for n from 0 below 10 collect (term n)))

;;; Tetrahedral numbers n(n+1)(n+2)/6
(defun term (n) (floor (* (* n (+ n 1)) (+ n 2)) 6))

(format t "~{~a ~}~%" (loop for n from 0 below 10 collect (term n)))

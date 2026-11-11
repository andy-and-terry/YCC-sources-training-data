;;; Centered square numbers 2n(n+1)+1
(defun term (n) (+ (* (* 2 n) (+ n 1)) 1))

(format t "~{~a ~}~%" (loop for n from 0 below 10 collect (term n)))

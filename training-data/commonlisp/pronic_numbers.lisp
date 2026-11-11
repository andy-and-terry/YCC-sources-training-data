;;; Pronic numbers n(n+1)
(defun term (n) (* n (+ n 1)))

(format t "~{~a ~}~%" (loop for n from 0 below 10 collect (term n)))

;; Cullen numbers: C(n) = n * 2^n + 1
(defun cullen (n)
  (+ (* n (expt 2 n)) 1))

(format t "~{~a~^ ~}~%" (loop for n from 0 to 9 collect (cullen n)))

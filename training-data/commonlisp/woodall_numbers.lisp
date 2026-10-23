;; Woodall numbers: W(n) = n * 2^n - 1
(defun woodall (n)
  (- (* n (expt 2 n)) 1))

(format t "~{~a~^ ~}~%" (loop for n from 1 to 10 collect (woodall n)))

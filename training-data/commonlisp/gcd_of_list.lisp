(defun gcd-all (&rest nums) (apply #'gcd nums))

(format t "~a~%" (gcd-all 12 18 24))
(format t "~a~%" (gcd-all 7 13))
(format t "~a~%" (lcm 4 6 10))

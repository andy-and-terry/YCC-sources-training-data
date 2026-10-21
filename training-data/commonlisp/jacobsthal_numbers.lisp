;;; Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
(defun jacobsthal (count)
  (loop repeat count
        for a = 0 then b
        and b = 1 then (+ b (* 2 a))
        collect a))

(format t "~{~a~^ ~}~%" (jacobsthal 15))

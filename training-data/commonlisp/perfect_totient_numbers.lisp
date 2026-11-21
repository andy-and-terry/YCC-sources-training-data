;;; Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
(defun phi (n)
  (loop for k from 1 to n count (= 1 (gcd k n))))

(defun chain-sum (m)
  (loop with total = 0
        while (> m 1)
        do (setf m (phi m))
           (incf total m)
        finally (return total)))

(format t "~{~a~^ ~}~%" (loop for n from 2 below 200 when (= n (chain-sum n)) collect n))

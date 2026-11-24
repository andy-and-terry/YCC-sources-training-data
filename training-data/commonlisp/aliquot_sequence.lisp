;;; Aliquot sequence: replace n by the sum of its proper divisors.
(defun aliquot-sum (n)
  (loop for d from 1 to (floor n 2) when (zerop (mod n d)) sum d))

(defun aliquot (n)
  (loop for x = n then (aliquot-sum x)
        for count from 0
        collect x
        while (and (> x 1) (< count 19))))

(format t "~{~a~^ ~}~%" (aliquot 12))

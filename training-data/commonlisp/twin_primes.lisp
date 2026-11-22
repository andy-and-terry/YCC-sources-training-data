;;; Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
(defun primep (n)
  (and (>= n 2)
       (loop for d from 2 to (isqrt n) never (zerop (mod n d)))))

(format t "~{~a~^ ~}~%"
        (loop for p from 2 below 100
              when (and (primep p) (primep (+ p 2))) collect p))

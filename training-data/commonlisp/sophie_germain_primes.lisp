;;; Sophie Germain primes: p prime and 2p + 1 prime.
(defun primep (n)
  (and (>= n 2)
       (loop for d from 2 to (isqrt n) never (zerop (mod n d)))))

(format t "~{~a~^ ~}~%"
        (loop for p from 2 below 100
              when (and (primep p) (primep (1+ (* 2 p)))) collect p))

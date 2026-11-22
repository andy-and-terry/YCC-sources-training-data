;;; Emirps: primes whose digit reversal is a different prime.
(defun primep (n)
  (and (>= n 2)
       (loop for d from 2 to (isqrt n) never (zerop (mod n d)))))

(defun reverse-num (n)
  (parse-integer (reverse (princ-to-string n))))

(format t "~{~a~^ ~}~%"
        (loop for n from 2 below 200
              for r = (reverse-num n)
              when (and (/= r n) (primep n) (primep r)) collect n))

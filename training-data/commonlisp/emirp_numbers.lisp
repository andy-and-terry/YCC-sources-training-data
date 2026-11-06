;;; Emirps: primes whose digit reversal is a different prime.
(defun primep (n)
  (and (>= n 2)
       (loop for i from 2 to (isqrt n) never (zerop (mod n i)))))

(defun rev (n)
  (parse-integer (reverse (princ-to-string n))))

(format t "~{~d ~}~%"
        (loop for n from 2 below 100
              when (and (/= (rev n) n) (primep n) (primep (rev n)))
                collect n))

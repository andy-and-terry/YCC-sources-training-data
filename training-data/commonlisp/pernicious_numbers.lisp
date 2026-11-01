;;; Pernicious numbers: the popcount is prime.
(defun primep (n)
  (and (>= n 2)
       (loop for d from 2 to (isqrt n) never (zerop (mod n d)))))

(format t "~{~a~^ ~}~%"
        (loop for n from 1 to 20 when (primep (logcount n)) collect n))

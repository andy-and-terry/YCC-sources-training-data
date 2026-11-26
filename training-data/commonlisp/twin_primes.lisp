;; Twin primes below 100; expect 8.
(defun primep (n)
  (and (> n 1)
       (loop for d from 2 while (<= (* d d) n) never (zerop (mod n d)))))

(print (loop for p from 2 below 100 count (and (primep p) (primep (+ p 2)))))

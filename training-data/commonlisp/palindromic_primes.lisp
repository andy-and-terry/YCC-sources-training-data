(defun primep (n)
  (and (> n 1)
       (loop for i from 2 to (isqrt n) never (zerop (mod n i)))))

(defun palindromep (n)
  (let ((s (write-to-string n)))
    (string= s (reverse s))))

(print (loop for n from 2 below 200
             when (and (palindromep n) (primep n)) collect n))
;; (2 3 5 7 11 101 131 151 181 191)

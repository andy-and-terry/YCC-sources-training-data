(defun primep (n)
  (and (> n 1)
       (loop for i from 2 to (isqrt n) never (zerop (mod n i)))))

(defun rev (n)
  (parse-integer (reverse (write-to-string n))))

(print (loop for p from 2 below 200
             when (and (/= p (rev p)) (primep p) (primep (rev p)))
               collect p))
;; (13 17 31 37 71 73 79 97 107 113 149 157 167 179 199)

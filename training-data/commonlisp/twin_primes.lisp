(defun primep (n)
  (and (> n 1) (loop for d from 2 to (isqrt n) never (zerop (mod n d)))))

(print (loop for p from 3 to 48
             when (and (primep p) (primep (+ p 2)))
               collect (list p (+ p 2))))

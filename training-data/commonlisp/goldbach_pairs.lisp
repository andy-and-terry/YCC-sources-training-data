(defun primep (n)
  (and (> n 1) (loop for d from 2 to (isqrt n) never (zerop (mod n d)))))

(defun goldbach (n)
  (loop for p from 2 to (floor n 2)
        when (and (primep p) (primep (- n p)))
          collect (list p (- n p))))

(print (goldbach 28))

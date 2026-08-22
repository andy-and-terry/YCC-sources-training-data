(defun primep (n)
  (and (> n 1)
       (loop for i from 2 to (isqrt n)
             never (zerop (mod n i)))))

(print (remove-if-not #'primep (loop for n from 2 to 20 collect n)))

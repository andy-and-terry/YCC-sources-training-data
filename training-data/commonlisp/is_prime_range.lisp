(defun prime-p (n)
  (and (> n 1)
       (loop for i from 2 to (isqrt n) never (zerop (mod n i)))))

(print (remove-if-not #'prime-p (loop for n from 2 to 30 collect n)))

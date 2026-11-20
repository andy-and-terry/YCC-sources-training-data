;; Wilson's theorem primality test.
(defun wilson-p (n)
  (and (>= n 2) (= (mod (loop with f = 1 for i from 2 below n do (setf f (mod (* f i) n)) finally (return f)) n) (1- n))))
(print (loop for n from 2 below 20 when (wilson-p n) collect n))

(defun popcount (n)
  (loop with c = 0
        until (zerop n)
        do (setf n (logand n (1- n)))
           (incf c)
        finally (return c)))

(print (list (popcount #b10110111) (logcount #b10110111)))

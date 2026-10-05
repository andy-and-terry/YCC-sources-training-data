(defun collatz-steps (n)
  (loop with steps = 0
        until (= n 1)
        do (setf n (if (evenp n) (floor n 2) (1+ (* 3 n))))
           (incf steps)
        finally (return steps)))

(dolist (n '(1 6 7 27))
  (format t "collatz(~d) = ~d steps~%" n (collatz-steps n)))

;;; Highest value reached by the Collatz (hailstone) sequence from n.
(defun peak (n)
  (let ((best n))
    (loop until (= n 1)
          do (setf n (if (evenp n) (floor n 2) (1+ (* 3 n)))
                   best (max best n)))
    best))

(format t "~d~%" (peak 27))

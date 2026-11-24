;;; Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
(let ((r 0))
  (loop repeat 8
        do (setf r (+ (* r 10) 1))
           (format t "~a~a~%" r (if (zerop (mod r 3)) "  (divisible by 3)" ""))))

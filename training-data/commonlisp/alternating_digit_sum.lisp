(defun alternating-digit-sum (n)
  (loop with sign = 1
        while (> n 0)
        sum (* sign (mod n 10))
        do (setf sign (- sign)
                 n (floor n 10))))

(dolist (n '(1234 99999 1000))
  (format t "~a ~a~%" n (alternating-digit-sum n)))

(defun rho (n)
  (if (evenp n)
      2
      (let ((x 2) (y 2) (d 1))
        (flet ((f (v) (mod (1+ (* v v)) n)))
          (loop while (= d 1)
                do (setf x (f x)
                         y (f (f y))
                         d (gcd (abs (- x y)) n))))
        d)))

(let* ((n 8051) (p (rho n)))
  (format t "~a = ~a * ~a~%" n p (floor n p)))

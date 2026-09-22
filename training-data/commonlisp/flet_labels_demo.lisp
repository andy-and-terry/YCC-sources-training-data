(defun describe-number (n)
  (flet ((square (x) (* x x))
         (cube (x) (* x x x)))
    (format t "~a squared=~a cubed=~a~%" n (square n) (cube n))))

(defun sum-to (n)
  (labels ((helper (i acc)
             (if (> i n) acc (helper (1+ i) (+ acc i)))))
    (helper 1 0)))

(describe-number 3)
(print (sum-to 10))

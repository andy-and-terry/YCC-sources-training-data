;;; Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
(defun fact (n) (if (<= n 1) 1 (* n (fact (1- n)))))
(defun comb (n k) (floor (fact n) (* (fact k) (fact (- n k)))))

(let ((n 5))
  (format t "~{~a~^ ~}~%"
          (loop for k from 1 to n
                collect (floor (* (comb (1- n) (1- k)) (fact n)) (fact k)))))

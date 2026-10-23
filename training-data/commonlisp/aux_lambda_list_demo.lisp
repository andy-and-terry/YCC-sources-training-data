;; &aux introduces local variables in the lambda list itself.
;; They are bound sequentially, like let*.
(defun hypotenuse (a b &aux (a2 (* a a)) (b2 (* b b)))
  (sqrt (+ a2 b2)))

(defun describe-range (lo hi &aux (span (- hi lo)) (mid (+ lo (/ span 2))))
  (list :span span :mid mid))

(format t "~a~%" (hypotenuse 3 4))
(format t "~a~%" (describe-range 10 20))

;; Later &aux variables can use earlier ones.
(defun chained (x &aux (y (* x 2)) (z (+ y 1)))
  (list x y z))
(format t "~a~%" (chained 5))

;;; Cantor pairing function and its inverse.
(defun pair (x y)
  (+ (floor (* (+ x y) (+ x y 1)) 2) y))

(defun unpair (z)
  (let* ((w (floor (1- (isqrt (1+ (* 8 z)))) 2))
         (y (- z (floor (* w (1+ w)) 2))))
    (list (- w y) y)))

(format t "~a~%" (pair 3 4))
(format t "~{~a~^ ~}~%" (unpair 32))

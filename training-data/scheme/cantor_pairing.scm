;; Cantor pairing function and its inverse.
(define (pair x y)
  (+ (quotient (* (+ x y) (+ x y 1)) 2) y))

(define (unpair z)
  (let* ((w (quotient (- (inexact->exact (floor (sqrt (+ (* 8 z) 1)))) 1) 2))
         (y (- z (quotient (* w (+ w 1)) 2))))
    (list (- w y) y)))

(display (pair 3 4)) (newline)
(let ((p (unpair 32)))
  (display (car p)) (display " ") (display (cadr p)) (newline))

;; Exact rational numbers in the numeric tower.

(define a 1/3)
(define b 1/6)

(display (+ a b)) (newline)
(display (* a b)) (newline)
(display (/ 6 4)) (newline)
(display (numerator 6/4)) (newline)
(display (denominator 6/4)) (newline)
(display (exact->inexact 1/3)) (newline)
(display (inexact->exact 0.5)) (newline)
(display (floor 7/2)) (newline)
(display (round 7/2)) (newline)
(display (exact? (/ 1 3))) (newline)

(define (harmonic n)
  (if (= n 0) 0 (+ (/ 1 n) (harmonic (- n 1)))))
(display (harmonic 6)) (newline)

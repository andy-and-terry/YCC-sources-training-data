#lang racket
;; Cantor pairing function and its inverse.
(define (pair x y)
  (+ (quotient (* (+ x y) (+ x y 1)) 2) y))

(define (unpair z)
  (define w (quotient (- (integer-sqrt (+ (* 8 z) 1)) 1) 2))
  (define y (- z (quotient (* w (+ w 1)) 2)))
  (list (- w y) y))

(displayln (pair 3 4))
(displayln (string-join (map number->string (unpair 32)) " "))

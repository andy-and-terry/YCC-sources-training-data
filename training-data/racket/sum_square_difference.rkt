#lang racket
;; Square of the sum minus sum of squares for 1..10 (expect 2640)
(define xs (range 1 11))
(define total (apply + xs))
(define squares (apply + (map (lambda (x) (* x x)) xs)))
(displayln (- (* total total) squares))

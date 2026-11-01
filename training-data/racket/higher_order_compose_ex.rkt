#lang racket
(define inc (λ (x) (+ x 1)))
(define dbl (λ (x) (* x 2)))
(displayln ((compose inc dbl) 5))
(displayln (map (curry + 10) '(1 2 3)))
(displayln (foldl + 0 '(1 2 3 4)))
(displayln (filter (negate even?) (range 10)))

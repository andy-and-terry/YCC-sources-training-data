#lang racket
(define add1-then-double (compose (λ (x) (* 2 x)) add1))
(displayln (add1-then-double 4))
(displayln (map (curry + 10) '(1 2 3)))
(displayln (foldl cons '() '(1 2 3)))

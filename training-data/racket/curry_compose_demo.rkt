#lang racket

(define add3 (curry + 3))
(displayln (add3 4))

(define (scale k x) (* k x))
(displayln (map (curry scale 10) '(1 2 3)))
(displayln ((curryr list 'end) 'x))

(define inc-then-double (compose (curry * 2) add1))
(displayln (inc-then-double 5))

(define pipeline (compose string-upcase string-trim))
(displayln (pipeline "  hello  "))

(displayln ((const 42) 'ignored 'args))
(displayln (map (negate even?) '(1 2 3 4)))
(displayln (filter (conjoin number? positive?) '(1 -2 "x" 3)))
(displayln ((identity add1) 1))

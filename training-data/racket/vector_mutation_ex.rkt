#lang racket
(define v (make-vector 5 0))
(for ([i (in-range 5)]) (vector-set! v i (* i i)))
(displayln v)
(displayln (vector-map add1 v))
(displayln (vector->list (vector-take v 2)))
(vector-sort! v >)
(displayln v)

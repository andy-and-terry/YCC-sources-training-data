#lang racket
(require racket/vector)

(define v (vector 5 3 8 1 9 2))

(vector-sort! v <)
(displayln v)
(displayln (vector-member 8 v))
(displayln (vector->list (vector-map add1 v)))
(displayln (vector-argmax identity v))
(displayln (vector-count even? v))
(vector-fill! v 0)
(displayln v)

(define m (make-vector 3 #f))
(for ([i 3]) (vector-set! m i (make-vector 3 (* i i))))
(displayln m)
(displayln (vector-copy (vector 1 2 3 4) 1 3))
(displayln (vector-append #(1 2) #(3)))

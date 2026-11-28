#lang racket
(displayln (for/list ([i (in-range 1 4)] #:when (odd? i) [c "ab"]) (cons i c)))
(displayln (for/sum ([x (in-list '(1 2 3))]) (* x x)))
(displayln (for/hash ([k '(a b)] [v (in-naturals)]) (values k v)))

#lang racket
(displayln (for/list ([i (in-range 1 6)] #:when (odd? i)) (* i i)))
(displayln (for/sum ([x '(1 2 3)]) x))
(displayln (for/hash ([k '(a b)] [v (in-naturals)]) (values k v)))

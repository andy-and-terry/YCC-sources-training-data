#lang racket
(displayln (for/list ([i (in-range 5)] #:when (odd? i)) (* i i)))
(displayln (for/sum ([x '(1 2 3)] [y '(4 5 6)]) (* x y)))
(displayln (for/hash ([k '(a b)] [v '(1 2)]) (values k v)))

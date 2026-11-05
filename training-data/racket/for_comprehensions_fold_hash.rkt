#lang racket
(displayln (for/list ([i 10] #:when (even? i)) (* i i)))
(displayln (for/fold ([sum 0]) ([i (in-range 1 6)]) (+ sum i)))
(displayln (for/hash ([k '(a b c)] [v (in-naturals)]) (values k v)))
(displayln (for*/list ([x '(1 2)] [y '(a b)]) (cons x y)))

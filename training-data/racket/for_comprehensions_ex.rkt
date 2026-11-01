#lang racket
(displayln (for/list ([i (in-range 1 6)]) (* i i)))
(displayln (for/sum ([i (in-range 10)] #:when (even? i)) i))
(displayln (for/hash ([k '(a b c)] [v (in-naturals)]) (values k v)))
(displayln (for*/list ([x '(1 2)] [y '(a b)]) (cons x y)))
(displayln (for/fold ([acc 1]) ([i (in-range 1 6)]) (* acc i)))

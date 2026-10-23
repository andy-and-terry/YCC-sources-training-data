#lang racket

(displayln (for/list ([i (in-range 5)]) (* i i)))
(displayln (for/sum ([i (in-range 1 11)]) i))
(displayln (for/hash ([k '(a b c)] [v (in-naturals)]) (values k v)))
(displayln (for/first ([i (in-naturals)] #:when (> (* i i) 50)) i))
(displayln (for/and ([x '(2 4 6)]) (even? x)))
(displayln (for*/list ([a '(1 2)] [b '(x y)]) (list a b)))

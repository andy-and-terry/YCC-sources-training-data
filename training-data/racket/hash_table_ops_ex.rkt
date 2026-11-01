#lang racket
(define h (make-hash))
(hash-set! h "a" 1)
(hash-update! h "a" add1)
(hash-ref! h "b" 10)
(displayln (hash-ref h "zzz" 'none))
(for ([(k v) (in-hash h)]) (printf "~a=~a\n" k v))
(displayln (sort (hash-keys h) string<?))

#lang racket
(define h (make-hash))
(for ([w '("a" "b" "a")]) (hash-update! h w add1 0))
(for ([(k v) (in-hash h)]) (printf "~a=~a\n" k v))

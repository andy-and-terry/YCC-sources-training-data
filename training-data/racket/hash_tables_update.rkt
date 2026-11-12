#lang racket
(define h (make-hash))
(for ([w '("a" "b" "a")]) (hash-update! h w add1 0))
(displayln (sort (hash->list h) string<? #:key car))

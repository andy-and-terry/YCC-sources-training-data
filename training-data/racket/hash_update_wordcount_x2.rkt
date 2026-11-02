#lang racket
(define h (for/fold ([h (hash)]) ([w '(a b a c a)]) (hash-update h w add1 0)))
(displayln (sort (hash->list h) symbol<? #:key car))

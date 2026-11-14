#lang racket
(define counts
  (for/fold ([h (hash)]) ([w '("a" "b" "a")])
    (hash-update h w add1 0)))
(displayln (sort (hash->list counts) string<? #:key car))

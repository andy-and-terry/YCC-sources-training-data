#lang racket
;; Deficient numbers below 100; expect 76.
(define (proper-sum n)
  (for/sum ([d (in-range 1 n)] #:when (zero? (modulo n d))) d))
(displayln (for/sum ([n (in-range 1 100)]) (if (< (proper-sum n) n) 1 0)))

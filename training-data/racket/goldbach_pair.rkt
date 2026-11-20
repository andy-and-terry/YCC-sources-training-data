#lang racket
;; Goldbach pair.
(define (prime? n) (and (> n 1) (for/and ([d (in-range 2 (add1 (integer-sqrt n)))]) (not (zero? (modulo n d))))))
(define (goldbach n) (for/first ([p (in-range 2 (add1 (quotient n 2)))] #:when (and (prime? p) (prime? (- n p)))) (cons p (- n p))))
(displayln (goldbach 28))

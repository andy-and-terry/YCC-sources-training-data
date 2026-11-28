#lang racket

(define (sigma n)
  (for/sum ([d (in-range 1 (add1 n))] #:when (zero? (modulo n d))) d))

(displayln (filter (lambda (n) (< (sigma n) (* 2 n))) (range 1 21)))

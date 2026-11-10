#lang racket
(define (sigma n) (for/sum ([d (in-range 1 (add1 n))] #:when (zero? (modulo n d))) d))
(displayln (for/list ([n (in-range 1 100)] #:when (= (sigma (sigma n)) (* 2 n))) n))
; (2 4 16 64)

#lang racket
(define (tau n) (for/sum ([d (in-range 1 (add1 n))]) (if (zero? (modulo n d)) 1 0)))
(displayln (for/list ([n (in-range 1 60)] #:when (zero? (modulo n (tau n)))) n))
; (1 2 8 9 12 18 24 36 40 56)

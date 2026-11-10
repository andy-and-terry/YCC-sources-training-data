#lang racket
(define (pieces cuts) (quotient (+ (* cuts cuts) cuts 2) 2))
(displayln (for/list ([n 10]) (pieces n))) ; (1 2 4 7 11 16 22 29 37 46)

#lang racket
;; Pentagonal numbers: n(3n-1)/2.
(displayln (string-join (for/list ([n (in-range 1 11)]) (number->string (quotient (* n (sub1 (* 3 n))) 2))) " "))

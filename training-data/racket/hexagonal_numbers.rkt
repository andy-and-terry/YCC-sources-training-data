#lang racket
;; Hexagonal numbers: n(2n-1).
(displayln (string-join (for/list ([n (in-range 1 11)]) (number->string (* n (sub1 (* 2 n))))) " "))

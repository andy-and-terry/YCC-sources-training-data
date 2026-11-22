#lang racket
;; Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
(displayln (string-join (for/list ([n (in-range 10)]) (number->string (+ 1 (quotient (* n (+ n 1)) 2)))) " "))

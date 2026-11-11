#lang racket
;; Lazy caterer sequence: max pieces from n cuts
(define (term n) (+ (quotient (* n (+ n 1)) 2) 1))

(displayln (string-join (map (compose number->string term) (range 10)) " "))

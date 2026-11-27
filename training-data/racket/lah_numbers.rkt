#lang racket

(define (fact n) (for/product ([i (in-range 1 (add1 n))]) i))
(define (comb n k) (/ (fact n) (* (fact k) (fact (- n k)))))
(define (lah n k) (/ (* (comb (sub1 n) (sub1 k)) (fact n)) (fact k)))

(for ([n (in-range 1 6)])
  (displayln (string-join (for/list ([k (in-range 1 (add1 n))]) (number->string (lah n k))) " ")))

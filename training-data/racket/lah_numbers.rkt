#lang racket
;; Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
(define (fact n) (for/product ([i (in-range 1 (+ n 1))]) i))
(define (comb n k) (quotient (fact n) (* (fact k) (fact (- n k)))))

(define n 5)
(displayln
 (string-join
  (for/list ([k (in-range 1 (+ n 1))])
    (number->string (quotient (* (comb (- n 1) (- k 1)) (fact n)) (fact k))))
  " "))

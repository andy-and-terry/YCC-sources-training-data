#lang racket
;; Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
(define (phi n)
  (for/sum ([k (in-range 1 (add1 n))]) (if (= 1 (gcd k n)) 1 0)))

(define (chain-sum m)
  (if (<= m 1) 0 (+ (phi m) (chain-sum (phi m)))))

(displayln (string-join (map number->string (filter (lambda (n) (= n (chain-sum n))) (range 2 200))) " "))

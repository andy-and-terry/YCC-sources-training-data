#lang racket
;; Hamming numbers (5-smooth): only prime factors 2, 3 and 5
(define (strip n p)
  (if (zero? (remainder n p)) (strip (quotient n p) p) n))

(define (hamming? n)
  (= 1 (strip (strip (strip n 2) 3) 5)))

(define found (take (filter hamming? (range 1 100)) 20))
(displayln (string-join (map number->string found) " "))

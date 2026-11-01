#lang racket

;; Positive n expressible as a*a + b*b with a, b >= 0.
(define (representable? n)
  (for/or ([a (in-range 0 (add1 (integer-sqrt n)))])
    (define b2 (- n (* a a)))
    (define b (integer-sqrt b2))
    (= b2 (* b b))))

(displayln (string-join (map number->string (filter representable? (range 1 31))) " "))

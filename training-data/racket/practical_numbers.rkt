#lang racket
;; Practical numbers: every m in 1..n is a sum of distinct divisors of n.
(define (practical? n)
  ;; bit i set <=> i is a subset sum of the divisors
  (define reach
    (for/fold ([acc 1]) ([d (in-range 1 (+ n 1))] #:when (zero? (modulo n d)))
      (bitwise-ior acc (arithmetic-shift acc d))))
  (define mask (- (arithmetic-shift 1 (+ n 1)) 1))
  (= (bitwise-and reach mask) mask))

(displayln (string-join (for/list ([n (in-range 1 41)] #:when (practical? n)) (number->string n)) " "))

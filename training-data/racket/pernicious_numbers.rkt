#lang racket

;; Pernicious numbers: the popcount is prime.
(define (prime? n)
  (and (>= n 2)
       (for/and ([d (in-range 2 (add1 (integer-sqrt n)))] #:when (< d n))
         (not (zero? (modulo n d))))))

(define (popcount n)
  (if (zero? n) 0 (+ (bitwise-and n 1) (popcount (arithmetic-shift n -1)))))

(displayln
 (string-join
  (map number->string (filter (lambda (n) (prime? (popcount n))) (range 1 21)))
  " "))

#lang racket
;; Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
(define (prime? n)
  (and (>= n 2)
       (for/and ([d (in-range 2 (+ 1 (integer-sqrt n)))]) (or (= d n) (not (zero? (modulo n d)))))))

(displayln
 (string-join
  (for/list ([p (in-range 2 100)] #:when (and (prime? p) (prime? (+ p 2)))) (number->string p))
  " "))

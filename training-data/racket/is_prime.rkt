#lang racket

(define (is-prime? n)
  (and (> n 1)
       (for/and ([i (in-range 2 (add1 (integer-sqrt n)))])
         (not (zero? (modulo n i))))))

(displayln (filter is-prime? (range 2 21)))

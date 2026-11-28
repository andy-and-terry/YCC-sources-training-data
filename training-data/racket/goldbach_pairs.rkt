#lang racket

(define (prime? n)
  (and (> n 1) (for/and ([d (in-range 2 (add1 (integer-sqrt n)))]) (not (zero? (modulo n d))))))

(define (goldbach n)
  (for/list ([p (in-range 2 (add1 (quotient n 2)))] #:when (and (prime? p) (prime? (- n p))))
    (list p (- n p))))

(displayln (goldbach 28))

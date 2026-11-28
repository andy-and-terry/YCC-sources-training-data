#lang racket

(define (prime? n)
  (and (> n 1) (for/and ([d (in-range 2 (add1 (integer-sqrt n)))]) (not (zero? (modulo n d))))))

(displayln (for/list ([p (in-range 3 49)] #:when (and (prime? p) (prime? (+ p 2))))
             (list p (+ p 2))))

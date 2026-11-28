#lang racket

(define (prime? n)
  (and (> n 1) (for/and ([i (in-range 2 (add1 (integer-sqrt n)))]) (not (zero? (modulo n i))))))

(displayln
 (for/fold ([acc '()] #:result (reverse acc)) ([y (in-naturals 1)] #:break (= (length acc) 8))
   (define p (+ (* 3 y y) (* 3 y) 1))
   (if (prime? p) (cons p acc) acc)))

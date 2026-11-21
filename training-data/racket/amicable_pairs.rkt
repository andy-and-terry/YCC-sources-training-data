#lang racket
;; Amicable pairs below 1500 via sums of proper divisors.
(define (s n)
  (for/sum ([d (in-range 1 n)] #:when (zero? (modulo n d))) d))

(for ([a (in-range 2 1500)])
  (define b (s a))
  (when (and (> b a) (= (s b) a))
    (printf "~a ~a\n" a b)))

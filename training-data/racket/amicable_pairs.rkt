#lang racket
;; Amicable pairs: d(a) = b and d(b) = a with a != b.
(define (d n)
  (for/sum ([i (in-range 1 n)] #:when (zero? (modulo n i))) i))

(for ([a (in-range 2 1500)])
  (define b (d a))
  (when (and (> b a) (= (d b) a))
    (printf "~a ~a\n" a b)))

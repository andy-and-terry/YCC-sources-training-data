#lang racket
;; n(n+1)(2n+1)/6
(define (term n)
  (quotient ((n * (n + 1)) * ((2 * n) + 1)) 6))

(for ([n (in-range 1 16)])
  (printf "~a -> ~a\n" n (term n)))

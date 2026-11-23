#lang racket
;; n^2(n+1)/2
(define (term n)
  (quotient ((n * n) * (n + 1)) 2))

(for ([n (in-range 1 16)])
  (printf "~a -> ~a\n" n (term n)))

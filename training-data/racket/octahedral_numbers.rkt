#lang racket
;; n(2n^2+1)/3
(define (term n)
  (quotient (n * (((2 * n) * n) + 1)) 3))

(for ([n (in-range 1 16)])
  (printf "~a -> ~a\n" n (term n)))

#lang racket
;; n(n+1)/2+1
(define (term n)
  ((quotient (n * (n + 1)) 2) + 1))

(for ([n (in-range 1 16)])
  (printf "~a -> ~a\n" n (term n)))

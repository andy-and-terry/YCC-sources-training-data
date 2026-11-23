#lang racket
;; 6n(n-1)+1
(define (term n)
  (((6 * n) * (n - 1)) + 1))

(for ([n (in-range 1 16)])
  (printf "~a -> ~a\n" n (term n)))

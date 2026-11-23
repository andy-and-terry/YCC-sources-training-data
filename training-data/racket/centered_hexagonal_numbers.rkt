#lang racket
;; 3n(n-1)+1
(define (term n)
  (((3 * n) * (n - 1)) + 1))

(for ([n (in-range 1 16)])
  (printf "~a -> ~a\n" n (term n)))

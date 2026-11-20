#lang racket
;; Aliquot sum classification.
(define (aliquot n) (for/sum ([d (in-range 1 n)] #:when (zero? (modulo n d))) d))
(for ([n '(6 12 15 28)])
  (define a (aliquot n))
  (printf "~a ~a ~a\n" n a (cond [(= a n) "perfect"] [(> a n) "abundant"] [else "deficient"])))

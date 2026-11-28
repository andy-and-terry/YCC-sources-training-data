#lang racket

(define (plus-one digits)
  (define-values (carry out)
    (for/fold ([c 1] [acc '()]) ([d (in-list (reverse digits))])
      (define s (+ d c))
      (values (quotient s 10) (cons (remainder s 10) acc))))
  (if (> carry 0) (cons carry out) out))

(displayln (plus-one '(1 2 9))) ; (1 3 0)
(displayln (plus-one '(9 9)))   ; (1 0 0)

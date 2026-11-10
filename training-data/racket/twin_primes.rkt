#lang racket
(define (prime? n)
  (and (>= n 2) (for/and ([d (in-range 2 (add1 (integer-sqrt n)))]) (not (zero? (modulo n d))))))
(displayln (for/list ([p (in-range 3 79)] #:when (and (prime? p) (prime? (+ p 2)))) (list p (+ p 2))))
; ((3 5) (5 7) (11 13) (17 19) (29 31) (41 43) (59 61) (71 73))

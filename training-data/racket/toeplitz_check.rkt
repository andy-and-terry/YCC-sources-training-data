#lang racket

(define (toeplitz? m)
  (for/and ([prev (in-list m)] [cur (in-list (rest m))])
    (equal? (rest cur) (take prev (sub1 (length cur))))))

(displayln (toeplitz? '((1 2 3) (4 1 2) (5 4 1))))
(displayln (toeplitz? '((1 2) (2 2))))

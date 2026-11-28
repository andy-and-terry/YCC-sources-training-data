#lang racket

(define (pronic? x)
  (define n (integer-sqrt x))
  (= x (* n (add1 n))))

(displayln (for/list ([n 10]) (* n (add1 n)))) ; (0 2 6 12 20 30 42 56 72 90)
(displayln (list (pronic? 56) (pronic? 57)))   ; (#t #f)

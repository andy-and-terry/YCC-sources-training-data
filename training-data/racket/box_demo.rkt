#lang racket

;; Boxes are single-cell mutable references, handy for closures.
(define b (box 0))
(displayln (unbox b))
(set-box! b 10)
(displayln (unbox b))

(define (make-counter)
  (define n (box 0))
  (lambda ()
    (set-box! n (add1 (unbox n)))
    (unbox n)))

(define c1 (make-counter))
(c1) (c1)
(displayln (c1))

(define ib (box-immutable 5))
(displayln (immutable? ib))
(displayln (box-cas! b 10 99))
(displayln (unbox b))

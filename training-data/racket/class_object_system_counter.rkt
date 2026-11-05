#lang racket
(define counter%
  (class object%
    (init-field [n 0])
    (super-new)
    (define/public (bump) (set! n (add1 n)) n)))
(define c (new counter%))
(send c bump)
(displayln (send c bump))

#lang racket
(define counter%
  (class object%
    (super-new)
    (field [n 0])
    (define/public (inc!) (set! n (add1 n)) n)))
(define c (new counter%))
(send c inc!)
(displayln (send c inc!))

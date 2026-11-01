#lang racket
(define counter%
  (class object%
    (init-field [n 0])
    (super-new)
    (define/public (inc!) (set! n (add1 n)) n)))

(define c (new counter% [n 10]))
(send c inc!)
(displayln (send c inc!))

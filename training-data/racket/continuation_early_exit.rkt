#lang racket
(define (find-first pred lst)
  (let/ec return
    (for ([x lst]) (when (pred x) (return x)))
    #f))
(displayln (find-first even? '(1 3 4 5)))

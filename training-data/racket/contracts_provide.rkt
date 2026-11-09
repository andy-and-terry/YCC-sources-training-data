#lang racket
(define/contract (safe-sqrt n)
  (-> (and/c real? (>=/c 0)) real?)
  (sqrt n))
(displayln (safe-sqrt 16))

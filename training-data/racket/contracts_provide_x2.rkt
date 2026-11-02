#lang racket
(define/contract (safe-sqrt n)
  (-> (>=/c 0) number?)
  (sqrt n))
(displayln (safe-sqrt 16))

#lang racket
(define/contract (safe-div a b)
  (-> number? (and/c number? (not/c zero?)) number?)
  (/ a b))
(displayln (safe-div 10 4))

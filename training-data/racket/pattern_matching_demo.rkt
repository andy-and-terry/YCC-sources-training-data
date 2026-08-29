#lang racket

(require racket/match)

(define (describe lst)
  (match lst
    ['() "empty"]
    [(list x) (format "single: ~a" x)]
    [(list x y) (format "pair: ~a ~a" x y)]
    [(cons x _) (format "starts with: ~a" x)]))

(displayln (describe '()))
(displayln (describe '(1)))
(displayln (describe '(1 2)))
(displayln (describe '(1 2 3)))

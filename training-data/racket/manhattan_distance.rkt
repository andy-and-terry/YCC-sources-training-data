#lang racket
;; Manhattan distance.
(define (manhattan a b) (for/sum ([x a] [y b]) (abs (- x y))))
(displayln (manhattan '(1 2) '(4 6)))

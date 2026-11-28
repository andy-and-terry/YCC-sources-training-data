#lang racket

(define (manhattan a b)
  (apply + (map (lambda (x y) (abs (- x y))) a b)))

(displayln (manhattan '(1 2) '(4 6)))

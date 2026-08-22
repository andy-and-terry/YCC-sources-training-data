#lang racket

(define numbers (range 1 11))
(define even-squares
  (map (lambda (x) (* x x)) (filter even? numbers)))
(define total (foldl + 0 numbers))

(displayln even-squares)
(displayln total)

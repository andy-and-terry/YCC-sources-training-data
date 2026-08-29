#lang racket

(define (transpose matrix)
  (apply map list matrix))

(define (multiply a b)
  (define bt (transpose b))
  (map (lambda (row) (map (lambda (col) (apply + (map * row col))) bt)) a))

(define a '((1 2) (3 4)))
(define b '((5 6) (7 8)))
(displayln (transpose a))
(displayln (multiply a b))

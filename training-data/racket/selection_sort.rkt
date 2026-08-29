#lang racket

(define (selection-sort lst)
  (if (null? lst)
      '()
      (let* ([min-val (apply min lst)])
        (cons min-val (selection-sort (remove min-val lst))))))

(displayln (selection-sort '(5 3 8 1 9 2)))

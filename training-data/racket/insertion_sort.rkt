#lang racket

(define (insert x lst)
  (cond
    [(null? lst) (list x)]
    [(<= x (car lst)) (cons x lst)]
    [else (cons (car lst) (insert x (cdr lst)))]))

(define (insertion-sort lst)
  (foldl insert '() lst))

(displayln (insertion-sort '(12 11 13 5 6)))

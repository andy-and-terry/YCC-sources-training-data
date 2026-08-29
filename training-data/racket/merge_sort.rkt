#lang racket

(define (merge-lists left right)
  (cond
    [(null? left) right]
    [(null? right) left]
    [(<= (car left) (car right)) (cons (car left) (merge-lists (cdr left) right))]
    [else (cons (car right) (merge-lists left (cdr right)))]))

(define (merge-sort lst)
  (if (or (null? lst) (null? (cdr lst)))
      lst
      (let-values ([(left right) (split-at lst (quotient (length lst) 2))])
        (merge-lists (merge-sort left) (merge-sort right)))))

(displayln (merge-sort '(5 2 9 1 5 6)))

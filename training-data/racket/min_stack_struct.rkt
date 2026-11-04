#lang racket

(struct entry (value min))

(define (push stack x)
  (cons (entry x (if (null? stack) x (min x (entry-min (car stack))))) stack))

(define s (foldl (λ (x acc) (push acc x)) '() '(5 3 7 2)))

(displayln (entry-min (car s)))
(displayln (entry-min (cadr s)))

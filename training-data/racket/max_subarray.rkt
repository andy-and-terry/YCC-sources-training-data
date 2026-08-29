#lang racket

(define (kadane lst)
  (define-values (best _)
    (for/fold ([best (car lst)] [current (car lst)])
              ([x (cdr lst)])
      (let ([new-current (max x (+ current x))])
        (values (max best new-current) new-current))))
  best)

(displayln (kadane '(-2 1 -3 4 -1 2 1 -5 4)))

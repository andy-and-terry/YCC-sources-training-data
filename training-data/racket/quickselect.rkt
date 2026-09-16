#lang racket

(define (quickselect lst k)
  (define pivot (list-ref lst (random (length lst))))
  (define highs (filter (lambda (x) (> x pivot)) lst))
  (define lows (filter (lambda (x) (< x pivot)) lst))
  (define pivots (filter (lambda (x) (= x pivot)) lst))
  (cond
    [(<= k (length highs)) (quickselect highs k)]
    [(<= k (+ (length highs) (length pivots))) pivot]
    [else (quickselect lows (- k (length highs) (length pivots)))]))

(define (kth-largest lst k)
  (quickselect lst k))

(define values '(3 2 1 5 6 4 8 7))
(displayln (kth-largest values 2))
(displayln (kth-largest values 1))

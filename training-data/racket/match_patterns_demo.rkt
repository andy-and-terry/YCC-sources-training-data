#lang racket

(define (describe v)
  (match v
    [(list) "empty list"]
    [(list x) (format "singleton ~a" x)]
    [(list x y ...) (format "head ~a, ~a more" x (length y))]
    [(? string? s) (string-append "string " s)]
    [(vector a b) (format "pair vector ~a ~a" a b)]
    [_ "unknown"]))

(displayln (describe '()))
(displayln (describe '(1)))
(displayln (describe '(1 2 3)))
(displayln (describe "hi"))
(displayln (describe (vector 1 2)))
(displayln (describe 3.5))

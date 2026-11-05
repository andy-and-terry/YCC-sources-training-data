#lang racket
(define (describe x)
  (match x
    [(list 'point a b) (format "point ~a ~a" a b)]
    [(list-rest 'seq h t) (format "seq head ~a" h)]
    [(? string? s) (string-upcase s)]
    [_ "unknown"]))
(displayln (describe '(point 1 2)))
(displayln (describe '(seq 9 8 7)))
(displayln (describe "hi"))

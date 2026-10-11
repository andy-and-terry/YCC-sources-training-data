#lang racket

(define (describe x)
  (match x
    [(list) "empty"]
    [(list a) (format "one: ~a" a)]
    [(list a b) (format "two: ~a ~a" a b)]
    [(list a b ...) (format "head ~a, ~a more" a (length b))]
    [(cons a b) "improper pair"]
    [(vector a b) (format "vec ~a ~a" a b)]
    [(? string? s) (string-upcase s)]
    [(? number? n) #:when (> n 100) "big number"]
    [(? number?) "number"]
    [_ "other"]))
(for ([v (list '() '(1) '(1 2) '(1 2 3 4) (cons 1 2) (vector 7 8) "hi" 500 5 'sym)])
  (displayln (describe v)))

(match '(1 (2 3) 4)
  [(list a (list b c) d) (displayln (+ a b c d))])
(match "key=val"
  [(regexp #rx"(.*)=(.*)" (list _ k v)) (printf "~a: ~a\n" k v)])
(displayln (match-let ([(list x y) '(10 20)]) (* x y)))
(displayln (match 5 [(or 1 5) 'one-or-five] [_ 'no]))
(displayln (match '(a . b) [(cons x y) (list y x)]))

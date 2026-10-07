#lang racket

(define (next-row row)
  (map + (cons 0 row) (append row '(0))))

(define (pascal n)
  (for/fold ([rows '()] [row '(1)] #:result (reverse rows))
            ([_ (in-range n)])
    (values (cons row rows) (next-row row))))

(for ([r (pascal 6)])
  (displayln (string-join (map number->string r) " ")))

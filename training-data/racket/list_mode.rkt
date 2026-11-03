#lang racket

(define (modes items)
  (define counts (for/fold ([h (hash)]) ([x items]) (hash-update h x add1 0)))
  (define top (apply max (hash-values counts)))
  (sort (for/list ([(k c) counts] #:when (= c top)) k) <))

(displayln (modes '(1 2 2 3 3 4)))

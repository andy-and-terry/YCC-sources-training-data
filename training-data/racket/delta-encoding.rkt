#lang racket
(define (delta-encode xs)
  (cons (first xs) (for/list ([a xs] [b (rest xs)]) (- b a))))
(define (delta-decode ds)
  (rest (for/fold ([acc '(0)]) ([d ds]) (cons (+ d (first acc)) acc))))
(define d (delta-encode '(10 12 15 15 20)))
(displayln d)
(displayln (reverse (delta-decode d)))

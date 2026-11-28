#lang racket

(define (four-sum-count a b c d)
  (define sums (make-hash))
  (for* ([x a] [y b]) (hash-update! sums (+ x y) add1 0))
  (for*/sum ([x c] [y d]) (hash-ref sums (- (+ x y)) 0)))

(displayln (four-sum-count '(1 2) '(-2 -1) '(-1 2) '(0 2))) ; 2

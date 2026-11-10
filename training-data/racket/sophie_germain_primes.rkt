#lang racket
(define (prime? n)
  (and (>= n 2) (for/and ([d (in-range 2 (add1 (integer-sqrt n)))]) (not (zero? (modulo n d))))))
(define (collect p left acc)
  (cond [(zero? left) (reverse acc)]
        [(and (prime? p) (prime? (add1 (* 2 p)))) (collect (add1 p) (sub1 left) (cons p acc))]
        [else (collect (add1 p) left acc)]))
(displayln (collect 2 10 '())) ; (2 3 5 11 23 29 41 53 83 89)

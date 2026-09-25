#lang racket

(define (prime-factors n)
  (let loop ([n n] [factor 2] [factors '()])
    (cond
      [(<= n 1) (reverse factors)]
      [(> (* factor factor) n) (reverse (cons n factors))]
      [(zero? (modulo n factor)) (loop (quotient n factor) factor (cons factor factors))]
      [else (loop n (add1 factor) factors)])))

(displayln (prime-factors 360))
(displayln (prime-factors 97))

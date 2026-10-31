#lang racket

(define (cube-from-odds n)
  (define start (+ (- (* n n) n) 1))
  (for/sum ([i (in-range n)]) (+ start (* 2 i))))

(for ([n (in-range 1 6)])
  (printf "~a ~a ~a\n" n (cube-from-odds n) (= (cube-from-odds n) (* n n n))))

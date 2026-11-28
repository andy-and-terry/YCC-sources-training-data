#lang racket

(define (equilibrium-index nums)
  (define total (apply + nums))
  (let loop ([xs nums] [i 0] [left 0])
    (cond [(null? xs) -1]
          [(= left (- total left (car xs))) i]
          [else (loop (cdr xs) (add1 i) (+ left (car xs)))])))

(displayln (equilibrium-index '(1 7 3 6 5 6))) ; 3

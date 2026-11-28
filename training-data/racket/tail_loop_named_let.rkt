#lang racket
(define (collatz n)
  (let loop ([n n] [steps 0])
    (cond [(= n 1) steps]
          [(even? n) (loop (/ n 2) (add1 steps))]
          [else (loop (+ (* 3 n) 1) (add1 steps))])))
(displayln (collatz 27))

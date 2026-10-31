#lang racket

(define (prime-factor-count n)
  (let loop ([n n] [p 2] [count 0])
    (cond [(> (* p p) n) (if (> n 1) (+ count 1) count)]
          [(zero? (remainder n p)) (loop (quotient n p) p (+ count 1))]
          [else (loop n (+ p 1) count)])))

(displayln (filter (lambda (n) (= (prime-factor-count n) 2)) (range 2 30)))

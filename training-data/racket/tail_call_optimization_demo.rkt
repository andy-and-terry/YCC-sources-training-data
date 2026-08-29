#lang racket

(define (sum-range a b)
  (let loop ([i a] [acc 0])
    (if (> i b) acc (loop (add1 i) (+ acc i)))))

(displayln (sum-range 1 100))

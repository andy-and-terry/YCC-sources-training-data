#lang racket

(define (factorial n)
  (let loop ([n n] [acc 1])
    (if (<= n 1) acc (loop (sub1 n) (* acc n)))))

(displayln (factorial 10))

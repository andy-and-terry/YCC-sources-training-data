#lang racket

(define (perfect-square? n)
  (and (>= n 0)
       (let ([r (integer-sqrt n)])
         (= (* r r) n))))

(displayln (filter perfect-square? (range 30)))

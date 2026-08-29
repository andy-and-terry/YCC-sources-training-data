#lang racket

(define (digit-sum n)
  (if (< n 10)
      n
      (+ (remainder n 10) (digit-sum (quotient n 10)))))

(displayln (digit-sum 12345))

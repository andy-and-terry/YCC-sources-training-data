#lang racket

;; Ways to write n as a sum of two or more consecutive positive integers.
(define (polite-ways n)
  (for/sum ([k (in-naturals 2)]
            #:break (> (quotient (* k (add1 k)) 2) n)
            #:when (zero? (modulo (- n (quotient (* k (sub1 k)) 2)) k)))
    1))

(displayln (string-join (map (compose number->string polite-ways) (range 1 17)) " "))

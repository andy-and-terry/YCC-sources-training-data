#lang racket

(define (fact k) (if (zero? k) 1 (* k (fact (- k 1)))))

(define (factorion? n)
  (= n (for/sum ([c (number->string n)]) (fact (- (char->integer c) 48)))))

(displayln (filter factorion? (range 1 50000)))

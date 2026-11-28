#lang racket

(define (fact n) (if (<= n 1) 1 (* n (fact (sub1 n)))))

(define (factorion? n)
  (= n (for/sum ([c (number->string n)]) (fact (- (char->integer c) 48)))))

(displayln (for/list ([n (in-range 1 50000)] #:when (factorion? n)) n))
;; (1 2 145 40585)

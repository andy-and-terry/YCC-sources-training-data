#lang racket

(define (digit-square-sum n)
  (for/sum ([c (in-string (number->string (abs n)))])
    (define d (- (char->integer c) 48))
    (* d d)))

(displayln (digit-square-sum 123))
(displayln (digit-square-sum -99))

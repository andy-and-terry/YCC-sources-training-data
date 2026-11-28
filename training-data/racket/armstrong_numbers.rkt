#lang racket

(define (armstrong? n)
  (define s (number->string n))
  (define len (string-length s))
  (= n (for/sum ([c s]) (expt (- (char->integer c) 48) len))))

(displayln (for/list ([n (in-range 1 1000)] #:when (armstrong? n)) n))
;; (1 2 3 4 5 6 7 8 9 153 370 371 407)

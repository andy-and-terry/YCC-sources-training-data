#lang racket
;; Disarium numbers: digits raised to their 1-based positions sum to n.
(define (disarium? n)
  (= n (for/sum ([c (number->string n)] [i (in-naturals 1)])
         (expt (- (char->integer c) 48) i))))

(displayln (string-join (map number->string (filter disarium? (range 1 1000))) " "))

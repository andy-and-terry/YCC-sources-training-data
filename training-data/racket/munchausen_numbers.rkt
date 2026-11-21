#lang racket
;; Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
(define (munchausen? n)
  (= n (for/sum ([c (number->string n)])
         (define d (- (char->integer c) 48))
         (if (zero? d) 0 (expt d d)))))

(displayln (string-join (map number->string (filter munchausen? (range 1 5000))) " "))

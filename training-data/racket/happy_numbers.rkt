#lang racket

(define (digit-square-sum n)
  (for/sum ([c (number->string n)]) (let ([d (- (char->integer c) 48)]) (* d d))))

(define (happy? n [seen '()])
  (cond [(= n 1) #t]
        [(member n seen) #f]
        [else (happy? (digit-square-sum n) (cons n seen))]))

(displayln (for/list ([n (in-range 1 40)] #:when (happy? n)) n))
;; (1 7 10 13 19 23 28 31 32 44)

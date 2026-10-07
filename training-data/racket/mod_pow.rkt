#lang racket

;; Modular exponentiation by repeated squaring.
(define (mod-pow base exp m)
  (let loop ([b (modulo base m)] [e exp] [result 1])
    (cond [(zero? e) result]
          [(odd? e) (loop (modulo (* b b) m) (quotient e 2) (modulo (* result b) m))]
          [else (loop (modulo (* b b) m) (quotient e 2) result)])))

(displayln (mod-pow 2 10 1000))
(displayln (mod-pow 3 200 13))
(displayln (mod-pow 7 (expt 10 18) 1000000007))

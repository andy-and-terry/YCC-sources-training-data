#lang racket
;; Sexy primes below 100; expect 16 pairs.
(define (prime? n)
  (and (> n 1)
       (let loop ([d 2])
         (cond [(> (* d d) n) #t]
               [(zero? (modulo n d)) #f]
               [else (loop (add1 d))]))))

(displayln (for/sum ([p (in-range 2 100)]) (if (and (prime? p) (prime? (+ p 6))) 1 0)))

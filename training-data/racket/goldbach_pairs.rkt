#lang racket
;; Goldbach partitions of 100; expect 6.
(define (prime? n)
  (and (> n 1)
       (let loop ([d 2])
         (cond [(> (* d d) n) #t]
               [(zero? (modulo n d)) #f]
               [else (loop (add1 d))]))))

(define pairs (for/list ([p (in-range 2 51)] #:when (and (prime? p) (prime? (- 100 p)))) (cons p (- 100 p))))
(displayln (length pairs))
(displayln pairs)

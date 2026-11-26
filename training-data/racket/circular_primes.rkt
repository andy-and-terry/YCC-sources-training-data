#lang racket
;; Circular primes below 100; expect 13.
(define (prime? n)
  (and (> n 1)
       (let loop ([d 2])
         (cond [(> (* d d) n) #t]
               [(zero? (modulo n d)) #f]
               [else (loop (add1 d))]))))

(define (circular? n)
  (define s (number->string n))
  (for/and ([i (in-range (string-length s))])
    (prime? (string->number (string-append (substring s i) (substring s 0 i))))))
(displayln (for/sum ([n (in-range 2 100)]) (if (circular? n) 1 0)))

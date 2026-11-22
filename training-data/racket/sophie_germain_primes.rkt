#lang racket
;; Sophie Germain primes: p prime and 2p + 1 prime.
(define (prime? n)
  (and (>= n 2)
       (for/and ([d (in-range 2 (+ 1 (integer-sqrt n)))]) (or (= d n) (not (zero? (modulo n d)))))))

(displayln
 (string-join
  (for/list ([p (in-range 2 100)] #:when (and (prime? p) (prime? (+ (* 2 p) 1)))) (number->string p))
  " "))

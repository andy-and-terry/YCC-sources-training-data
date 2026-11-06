#lang racket
;; Emirps: primes whose digit reversal is a different prime.
(define (prime? n)
  (and (>= n 2)
       (for/and ([i (in-range 2 (+ 1 (integer-sqrt n)))])
         (not (zero? (modulo n i))))))

(define (rev n)
  (string->number (list->string (reverse (string->list (number->string n))))))

(displayln
 (for/list ([n (in-range 2 100)]
            #:when (and (not (= (rev n) n)) (prime? n) (prime? (rev n))))
   n))

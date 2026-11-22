#lang racket
;; Emirps: primes whose digit reversal is a different prime.
(define (prime? n)
  (and (>= n 2)
       (for/and ([d (in-range 2 (+ 1 (integer-sqrt n)))]) (or (= d n) (not (zero? (modulo n d)))))))

(define (rev n) (string->number (list->string (reverse (string->list (number->string n))))))

(displayln
 (string-join
  (for/list ([n (in-range 2 200)] #:when (let ([r (rev n)]) (and (not (= r n)) (prime? n) (prime? r))))
    (number->string n))
  " "))

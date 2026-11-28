#lang racket

(define (prime? n)
  (and (> n 1) (for/and ([i (in-range 2 (add1 (integer-sqrt n)))]) (not (zero? (modulo n i))))))

(define (rev n) (string->number (list->string (reverse (string->list (number->string n))))))

(displayln (for/list ([p (in-range 2 100)]
                      #:when (and (prime? p) (not (= p (rev p))) (prime? (rev p))))
             p))

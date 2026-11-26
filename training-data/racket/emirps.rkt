#lang racket
;; Emirps below 200; expect 15.
(define (prime? n)
  (and (> n 1)
       (let loop ([d 2])
         (cond [(> (* d d) n) #t]
               [(zero? (modulo n d)) #f]
               [else (loop (add1 d))]))))

(define (rev n) (string->number (list->string (reverse (string->list (number->string n))))))
(define found (for/list ([n (in-range 2 200)] #:when (and (not (= (rev n) n)) (prime? n) (prime? (rev n)))) n))
(displayln (length found))
(displayln found)

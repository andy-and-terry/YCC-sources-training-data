#lang racket

;; begin0 evaluates a sequence but returns the value of the FIRST expression.

(define counter 0)

(define (next-id!)
  (begin0
    counter
    (set! counter (add1 counter))))

(displayln (list (next-id!) (next-id!) (next-id!)))
(displayln counter)

;; Pop from a mutable stack: return the top, then remove it.
(define stack (list 'c 'b 'a))
(define (pop!)
  (begin0
    (car stack)
    (set! stack (cdr stack))))

(displayln (pop!))
(displayln stack)

;; Multiple values are preserved by begin0.
(define-values (q r)
  (begin0
    (quotient/remainder 17 5)
    (displayln "computed division")))
(displayln (list q r))

#lang racket
(require racket/promise)

(define p (delay (begin (displayln "computing") 42)))
(displayln (promise? p))
(displayln (force p))
(displayln (force p))

(define-syntax-rule (my-delay e) (lambda () e))
(define thunk (my-delay (+ 1 2)))
(displayln (thunk))

(define (stream-from n) (cons n (delay (stream-from (add1 n)))))
(define (take-s s k)
  (if (zero? k) '() (cons (car s) (take-s (force (cdr s)) (sub1 k)))))
(displayln (take-s (stream-from 5) 4))

(define lz (lazy (+ 1 1)))
(displayln (force lz))
(displayln (force 99))
(define-values (a b) (values (delay 1) (delay 2)))
(displayln (+ (force a) (force b)))

#lang racket

;; splitf-at / takef / dropf split a list by a predicate; memf returns the tail.
(define nums '(2 4 6 7 8 10))

(define-values (evens rest) (splitf-at nums even?))
(displayln evens)
(displayln rest)

(displayln (takef nums even?))
(displayln (dropf nums even?))

;; memf returns the sublist starting at the first match, or #f.
(displayln (memf odd? nums))
(displayln (memf (lambda (n) (> n 100)) nums))

(define-values (init tail) (split-at-right nums 2))
(displayln init)
(displayln tail)

#lang racket

(define (classify n)
  (cond
    [(negative? n) 'neg]
    [(zero? n) 'zero]
    [(< n 10) 'small]
    [else 'big]))
(displayln (map classify '(-5 0 3 50)))

;; => passes the test value to a procedure
(define (lookup k)
  (cond [(assoc k '((a . 1) (b . 2))) => cdr]
        [else 'missing]))
(displayln (list (lookup 'a) (lookup 'z)))

(define (vowel? c)
  (case c
    [(#\a #\e #\i #\o #\u) #t]
    [else #f]))
(displayln (map vowel? (string->list "hey")))

(displayln (case (* 2 3) [(2 3 5 7) 'prime] [(1 4 6 8 9) 'composite]))
(displayln (and 1 2 3))
(displayln (or #f #f 'first-truthy))
(displayln (when (> 1 0) 'yes))
(displayln (unless (> 1 0) 'no))

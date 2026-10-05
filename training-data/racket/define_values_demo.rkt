#lang racket

(define (min-max lst)
  (values (apply min lst) (apply max lst)))

(define-values (lo hi) (min-max '(4 8 1 9 3)))
(printf "~a ~a\n" lo hi)

(define (quotient/rem a b)
  (values (quotient a b) (remainder a b)))

(call-with-values (lambda () (quotient/rem 17 5))
                  (lambda (q r) (printf "q=~a r=~a\n" q r)))

(let-values ([(q r) (quotient/remainder 100 7)]
             [(a . rest) (apply values '(1 2 3))])
  (printf "~a ~a ~a ~a\n" q r a rest))

(define-values (evens odds) (partition even? (range 10)))
(displayln evens)
(displayln odds)

(match-define (list x (list y z)) '(1 (2 3)))
(displayln (+ x y z))

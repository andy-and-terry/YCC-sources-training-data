#lang racket

(define (min-max lst)
  (values (apply min lst) (apply max lst)))

(let-values ([(lo hi) (min-max '(4 9 2 7))])
  (printf "lo=~a hi=~a\n" lo hi))

(let-values ([(head tail) (split-at '(1 2 3 4 5) 2)]
             [(q r) (quotient/remainder 17 5)])
  (printf "~a ~a ~a ~a\n" head tail q r))

(define-values (evens odds) (partition even? '(1 2 3 4 5 6)))
(printf "~a ~a\n" evens odds)

(call-with-values (lambda () (values 1 2 3)) list)
(displayln (call-with-values (lambda () (values 1 2 3)) list))

(for/lists (xs ys) ([i (in-range 4)])
  (values i (* i i)))
(define-values (xs ys)
  (for/lists (a b) ([i (in-range 4)]) (values i (* i i))))
(printf "~a ~a\n" xs ys)

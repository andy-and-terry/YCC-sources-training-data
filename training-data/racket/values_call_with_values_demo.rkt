#lang racket

(define (min-max lst)
  (values (apply min lst) (apply max lst)))

(call-with-values (lambda () (min-max '(3 1 4 1 5)))
                  (lambda (lo hi) (printf "lo=~a hi=~a\n" lo hi)))

(define-values (lo hi) (min-max '(9 2 7)))
(displayln (list lo hi))

(let-values ([(q r) (quotient/remainder 100 7)]
             [(a . rest) (values 1 2 3)])
  (displayln (list q r a rest)))

(displayln (call-with-values (lambda () (values 1 2 3)) list))
(define-values (x y z) (values 'a 'b 'c))
(displayln (list z y x))
(displayln (with-handlers ([exn:fail? (lambda (e) 'arity-error)])
             (let-values ([(a b) (values 1 2 3)]) a)))
(displayln (call-with-values (lambda () 5) add1))

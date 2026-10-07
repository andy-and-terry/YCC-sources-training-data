#lang racket

(define (min-max lst)
  (values (apply min lst) (apply max lst)))

(define-values (lo hi) (min-max '(4 9 1 7)))
(displayln (list lo hi))

(call-with-values (lambda () (quotient/remainder 17 5))
                  (lambda (q r) (printf "q=~a r=~a\n" q r)))

(let-values ([(q r) (quotient/remainder 100 7)]
             [(a . rest) (values 1 2 3)])
  (displayln (list q r a rest)))

(let*-values ([(a b) (values 1 2)]
              [(c) (+ a b)])
  (displayln (list a b c)))

(define (split-at-first-negative lst)
  (let loop ([xs lst] [acc '()])
    (cond [(null? xs) (values (reverse acc) '())]
          [(negative? (car xs)) (values (reverse acc) xs)]
          [else (loop (cdr xs) (cons (car xs) acc))])))
(define-values (before after) (split-at-first-negative '(3 5 -1 8 -2)))
(displayln (list before after))

(define-values (evens odds) (partition even? (range 10)))
(displayln (list evens odds))

(define-values (front back) (split-at '(a b c d e) 2))
(displayln (list front back))

(call-with-values (lambda () (for/lists (xs ys) ([i 3]) (values i (* i i))))
                  (lambda (xs ys) (displayln (list xs ys))))
(displayln (call-with-values (lambda () (values)) list))
(displayln (with-handlers ([exn:fail? (lambda (e) "arity error")])
             (let-values ([(a b) (values 1)]) a)))

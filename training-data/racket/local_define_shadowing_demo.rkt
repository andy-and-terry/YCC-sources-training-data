#lang racket

(define x 'outer)
(define (show) x)
(define (shadow)
  (define x 'inner)
  (list x (show)))
(displayln (shadow))

(define (counter-demo)
  (define n 0)
  (define (bump!) (set! n (add1 n)) n)
  (bump!) (bump!)
  n)
(displayln (counter-demo))

(let ([list '(shadowed)])
  (displayln list))
(displayln (list 1 2))

(define (f #:x [x 1] #:y [y x]) (+ x y))
(displayln (f))
(displayln (f #:x 5))
(displayln (let loop ([i 0] [acc '()])
  (if (= i 3) (reverse acc) (loop (add1 i) (cons i acc)))))
(displayln (let () (define a 1) (define b (+ a 1)) (list a b)))

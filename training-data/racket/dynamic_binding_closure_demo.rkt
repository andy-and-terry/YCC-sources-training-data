#lang racket

(define (make-accumulator total)
  (lambda (n)
    (set! total (+ total n))
    total))

(define acc (make-accumulator 100))
(displayln (acc 10))
(displayln (acc 10))

(define (make-counter)
  (define n 0)
  (values (lambda () (set! n (add1 n)) n)
          (lambda () (set! n 0))))

(define-values (next! reset!) (make-counter))
(next!)
(next!)
(displayln (next!))
(reset!)
(displayln (next!))

(define adders (for/list ([i 3]) (lambda (x) (+ x i))))
(displayln (map (lambda (f) (f 10)) adders))

(define (curry-add a) (lambda (b) (lambda (c) (+ a b c))))
(displayln (((curry-add 1) 2) 3))
(displayln ((curry + 1 2) 3))
(displayln ((compose add1 (curry * 2)) 5))

#lang racket

(define (find-first pred lst)
  (call/cc
   (lambda (return)
     (for ([x lst])
       (when (pred x) (return x)))
     #f)))

(displayln (find-first even? '(1 3 5 6 7)))
(displayln (find-first even? '(1 3 5 7)))

(define (product-with-shortcut lst)
  (call/cc
   (lambda (k)
     (define (helper lst)
       (cond
         [(null? lst) 1]
         [(zero? (car lst)) (k 0)]
         [else (* (car lst) (helper (cdr lst)))]))
     (helper lst))))

(displayln (product-with-shortcut '(1 2 3 4 5)))
(displayln (product-with-shortcut '(1 2 0 4 5)))

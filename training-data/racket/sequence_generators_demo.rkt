#lang racket

(define (take-seq n seq)
  (for/list ([x seq] [_ (in-range n)]) x))

(displayln (take-seq 5 (in-naturals 10)))
(displayln (for/list ([x (in-range 0 20 5)]) x))
(displayln (for/list ([c (in-string "abc")] [i (in-naturals)]) (cons i c)))
(displayln (for/list ([(a b) (in-parallel '(1 2 3) '(x y z))]) (list a b)))
(displayln (for*/list ([x '(1 2)] [y '(a b)]) (list x y)))
(displayln (for/sum ([x (in-range 1 11)]) x))
(displayln (for/and ([x '(2 4 6)]) (even? x)))
(displayln (for/first ([x (in-naturals 1)] #:when (> (* x x) 50)) x))
(displayln (for/vector ([i 4]) (* i i)))

(define (evens)
  (make-do-sequence
   (lambda () (values (lambda (n) n) (lambda (n) (+ n 2)) 0 (lambda (n) #t) #f #f))))
(displayln (take-seq 4 (evens)))
(displayln (sequence->list (in-slice 2 '(1 2 3 4 5))))

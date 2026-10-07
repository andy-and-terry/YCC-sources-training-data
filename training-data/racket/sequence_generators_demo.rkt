#lang racket

(displayln (for/list ([i (in-naturals 10)] [c (in-string "abc")])
             (cons i c)))

(displayln (for/list ([x (in-cycle '(1 2 3))] [_ (in-range 7)]) x))

(displayln (sequence->list (sequence-map add1 (in-range 4))))
(displayln (sequence->list (sequence-filter even? (in-range 10))))
(displayln (sequence->list (in-slice 2 (in-range 7))))

(define-values (more? next) (sequence-generate (in-list '(a b c))))
(let loop ()
  (when (more?)
    (displayln (next))
    (loop)))

(displayln (for/first ([n (in-naturals 1)] #:when (> (* n n) 50)) n))

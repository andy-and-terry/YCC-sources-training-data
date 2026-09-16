#lang racket

(define (next-greater-elements lst)
  (define vec (list->vector lst))
  (define n (vector-length vec))
  (define result (make-vector n -1))
  (define stack '())

  (for ([i (in-range n)])
    (let loop ()
      (when (and (not (null? stack))
                 (< (vector-ref vec (car stack)) (vector-ref vec i)))
        (vector-set! result (car stack) (vector-ref vec i))
        (set! stack (cdr stack))
        (loop)))
    (set! stack (cons i stack)))

  (vector->list result))

(displayln (next-greater-elements '(2 1 2 4 3)))
(displayln (next-greater-elements '(4 3 2 1)))

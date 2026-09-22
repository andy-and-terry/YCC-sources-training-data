#lang racket

;; Racket vectors are mutable, fixed-size, O(1)-indexed arrays --
;; distinct from the immutable, linked-list-based `list`.

(define v (make-vector 5 0))
(for ([i (in-range 5)])
  (vector-set! v i (* i i)))
(displayln v)

(define doubled (vector-map (lambda (x) (* x 2)) v))
(displayln doubled)

(displayln (vector->list doubled))

(define sortable (vector 5 3 8 1 9))
(vector-sort! sortable <)
(displayln sortable)

(displayln (vector-ref sortable 0))
(displayln (vector-member 8 sortable))

#lang racket

(define (trap-rain-water heights)
  (define vec (list->vector heights))
  (define n (vector-length vec))
  (if (zero? n)
      0
      (let loop ([left 0] [right (sub1 n)]
                 [left-max (vector-ref vec 0)] [right-max (vector-ref vec (sub1 n))]
                 [trapped 0])
        (cond
          [(>= left right) trapped]
          [(<= left-max right-max)
           (define new-left (add1 left))
           (define new-left-max (max left-max (vector-ref vec new-left)))
           (loop new-left right new-left-max right-max
                 (+ trapped (- new-left-max (vector-ref vec new-left))))]
          [else
           (define new-right (sub1 right))
           (define new-right-max (max right-max (vector-ref vec new-right)))
           (loop left new-right left-max new-right-max
                 (+ trapped (- new-right-max (vector-ref vec new-right))))]))))

(displayln (trap-rain-water '(0 1 0 2 1 0 1 3 2 1 2 1)))
(displayln (trap-rain-water '(4 2 0 3 2 5)))

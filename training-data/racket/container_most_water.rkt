#lang racket

(define (max-area h)
  (define v (list->vector h))
  (let loop ([lo 0] [hi (sub1 (vector-length v))] [best 0])
    (if (>= lo hi)
        best
        (let* ([a (vector-ref v lo)]
               [b (vector-ref v hi)]
               [best (max best (* (min a b) (- hi lo)))])
          (if (< a b) (loop (add1 lo) hi best) (loop lo (sub1 hi) best))))))

(displayln (max-area '(1 8 6 2 5 4 8 3 7))) ; 49

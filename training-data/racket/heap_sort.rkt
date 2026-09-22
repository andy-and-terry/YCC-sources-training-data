#lang racket

;; In-place binary max-heap sort over a 0-indexed mutable vector:
;; left child of i is (2*i + 1).

(define (sift-down! v root end)
  (define child (+ (* 2 root) 1))
  (when (<= child end)
    (define bigger-child
      (if (and (<= (add1 child) end) (> (vector-ref v (add1 child)) (vector-ref v child)))
          (add1 child)
          child))
    (when (< (vector-ref v root) (vector-ref v bigger-child))
      (define tmp (vector-ref v root))
      (vector-set! v root (vector-ref v bigger-child))
      (vector-set! v bigger-child tmp)
      (sift-down! v bigger-child end))))

(define (heap-sort items)
  (define v (list->vector items))
  (define n (vector-length v))
  (for ([start (in-range (sub1 (quotient n 2)) -1 -1)])
    (sift-down! v start (sub1 n)))
  (for ([end (in-range (sub1 n) 0 -1)])
    (define tmp (vector-ref v 0))
    (vector-set! v 0 (vector-ref v end))
    (vector-set! v end tmp)
    (sift-down! v 0 (sub1 end)))
  (vector->list v))

(displayln (heap-sort '(5 2 9 1 5 6 -3 0)))

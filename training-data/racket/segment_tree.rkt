#lang racket

;; Segment tree over a fixed array supporting range-sum queries and
;; point updates in O(log n), backed by a mutable vector sized 4*n.

(define (build values)
  (define n (vector-length values))
  (define tree (make-vector (* 4 n) 0))
  (define (build! node lo hi)
    (cond
      [(= lo hi) (vector-set! tree node (vector-ref values lo))]
      [else
       (define mid (quotient (+ lo hi) 2))
       (build! (+ (* 2 node) 1) lo mid)
       (build! (+ (* 2 node) 2) (+ mid 1) hi)
       (vector-set! tree node (+ (vector-ref tree (+ (* 2 node) 1))
                                  (vector-ref tree (+ (* 2 node) 2))))]))
  (when (> n 0) (build! 0 0 (- n 1)))
  (list tree n))

(define (seg-update! st index value)
  (define tree (first st))
  (define n (second st))
  (define (update! node lo hi)
    (cond
      [(= lo hi) (vector-set! tree node value)]
      [else
       (define mid (quotient (+ lo hi) 2))
       (if (<= index mid)
           (update! (+ (* 2 node) 1) lo mid)
           (update! (+ (* 2 node) 2) (+ mid 1) hi))
       (vector-set! tree node (+ (vector-ref tree (+ (* 2 node) 1))
                                  (vector-ref tree (+ (* 2 node) 2))))]))
  (update! 0 0 (- n 1)))

(define (seg-query st ql qr)
  (define tree (first st))
  (define n (second st))
  (define (query node lo hi)
    (cond
      [(or (> ql hi) (< qr lo)) 0]
      [(and (<= ql lo) (>= qr hi)) (vector-ref tree node)]
      [else
       (define mid (quotient (+ lo hi) 2))
       (+ (query (+ (* 2 node) 1) lo mid)
          (query (+ (* 2 node) 2) (+ mid 1) hi))]))
  (query 0 0 (- n 1)))

(define st (build (vector 1 3 5 7 9 11)))
(displayln (seg-query st 1 3)) ; 3+5+7 = 15
(seg-update! st 1 10)          ; values now 1 10 5 7 9 11
(displayln (seg-query st 1 3)) ; 10+5+7 = 22
(displayln (seg-query st 0 5)) ; full sum = 43

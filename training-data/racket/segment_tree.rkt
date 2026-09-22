#lang racket

(struct seg-tree (vec n) #:mutable)

(define (build-segment-tree arr)
  (define n (vector-length arr))
  (define tree (make-vector (* 4 n) 0))
  (define (build node start end)
    (cond
      [(= start end) (vector-set! tree node (vector-ref arr start))]
      [else
       (define mid (quotient (+ start end) 2))
       (build (* 2 node) start mid)
       (build (+ (* 2 node) 1) (+ mid 1) end)
       (vector-set! tree node (+ (vector-ref tree (* 2 node))
                                  (vector-ref tree (+ (* 2 node) 1))))]))
  (build 1 0 (sub1 n))
  (seg-tree tree n))

(define (segment-query st node start end l r)
  (cond
    [(or (> l end) (< r start)) 0]
    [(and (<= l start) (>= r end)) (vector-ref (seg-tree-vec st) node)]
    [else
     (define mid (quotient (+ start end) 2))
     (+ (segment-query st (* 2 node) start mid l r)
        (segment-query st (+ (* 2 node) 1) (+ mid 1) end l r))]))

(define (segment-update! st node start end idx value)
  (define tree (seg-tree-vec st))
  (cond
    [(= start end) (vector-set! tree node value)]
    [else
     (define mid (quotient (+ start end) 2))
     (if (<= idx mid)
         (segment-update! st (* 2 node) start mid idx value)
         (segment-update! st (+ (* 2 node) 1) (+ mid 1) end idx value))
     (vector-set! tree node (+ (vector-ref tree (* 2 node))
                                (vector-ref tree (+ (* 2 node) 1))))]))

(define arr (vector 1 3 5 7 9 11))
(define st (build-segment-tree arr))
(displayln (segment-query st 1 0 (sub1 (seg-tree-n st)) 1 4))
(segment-update! st 1 0 (sub1 (seg-tree-n st)) 1 10)
(displayln (segment-query st 1 0 (sub1 (seg-tree-n st)) 1 4))

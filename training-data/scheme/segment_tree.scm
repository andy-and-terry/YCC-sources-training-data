;; Segment tree over a vector supporting range-sum queries.

(define (build-tree arr tree node start stop)
  (if (= start stop)
      (vector-set! tree node (vector-ref arr start))
      (let ((mid (quotient (+ start stop) 2)))
        (build-tree arr tree (+ (* 2 node) 1) start mid)
        (build-tree arr tree (+ (* 2 node) 2) (+ mid 1) stop)
        (vector-set! tree node (+ (vector-ref tree (+ (* 2 node) 1))
                                   (vector-ref tree (+ (* 2 node) 2)))))))

(define (query tree node start stop l r)
  (cond ((or (> l stop) (> start r)) 0)
        ((and (<= l start) (<= stop r)) (vector-ref tree node))
        (else
         (let ((mid (quotient (+ start stop) 2)))
           (+ (query tree (+ (* 2 node) 1) start mid l r)
              (query tree (+ (* 2 node) 2) (+ mid 1) stop l r))))))

(define (make-segment-tree arr)
  (let* ((n (vector-length arr))
         (tree (make-vector (* 4 n) 0)))
    (build-tree arr tree 0 0 (- n 1))
    tree))

(define values #(1 3 5 7 9 11))
(define tree (make-segment-tree values))

(display (query tree 0 0 (- (vector-length values) 1) 1 3))
(newline)
(display (query tree 0 0 (- (vector-length values) 1) 0 5))
(newline)

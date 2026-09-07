#lang racket

(struct heap (vec size) #:mutable)

(define (make-heap capacity)
  (heap (make-vector capacity 0) 0))

(define (swap! vec i j)
  (define tmp (vector-ref vec i))
  (vector-set! vec i (vector-ref vec j))
  (vector-set! vec j tmp))

(define (sift-up! h i)
  (when (> i 0)
    (define vec (heap-vec h))
    (define parent (quotient (sub1 i) 2))
    (when (< (vector-ref vec i) (vector-ref vec parent))
      (swap! vec i parent)
      (sift-up! h parent))))

(define (heap-push! h val)
  (define vec (heap-vec h))
  (define size (heap-size h))
  (vector-set! vec size val)
  (set-heap-size! h (add1 size))
  (sift-up! h size))

(define (sift-down! h i)
  (define vec (heap-vec h))
  (define size (heap-size h))
  (define left (+ (* 2 i) 1))
  (define right (+ (* 2 i) 2))
  (define smallest i)
  (when (and (< left size) (< (vector-ref vec left) (vector-ref vec smallest)))
    (set! smallest left))
  (when (and (< right size) (< (vector-ref vec right) (vector-ref vec smallest)))
    (set! smallest right))
  (unless (= smallest i)
    (swap! vec i smallest)
    (sift-down! h smallest)))

(define (heap-pop! h)
  (define vec (heap-vec h))
  (define size (heap-size h))
  (define top (vector-ref vec 0))
  (vector-set! vec 0 (vector-ref vec (sub1 size)))
  (set-heap-size! h (sub1 size))
  (sift-down! h 0)
  top)

(define h (make-heap 10))
(for ([v '(5 3 8 1 9 2)]) (heap-push! h v))

(define sorted
  (let loop ([acc '()])
    (if (zero? (heap-size h))
        (reverse acc)
        (loop (cons (heap-pop! h) acc)))))
(displayln sorted)

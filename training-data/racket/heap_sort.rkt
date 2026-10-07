#lang racket

;; Sift the element at `root` down a 0-indexed binary max-heap stored
;; in `vec`, considering only the first `size` slots as part of the
;; heap.
(define (sift-down! vec size root0)
  (let loop ([root root0])
    (define left (+ (* 2 root) 1))
    (define right (+ (* 2 root) 2))
    (define largest
      (cond
        [(and (< left size) (> (vector-ref vec left) (vector-ref vec root)))
         (if (and (< right size) (> (vector-ref vec right) (vector-ref vec left)))
             right
             left)]
        [(and (< right size) (> (vector-ref vec right) (vector-ref vec root)))
         right]
        [else root]))
    (unless (= largest root)
      (define tmp (vector-ref vec root))
      (vector-set! vec root (vector-ref vec largest))
      (vector-set! vec largest tmp)
      (loop largest))))

(define (heap-sort! vec)
  (define n (vector-length vec))
  (for ([i (in-range (sub1 (quotient n 2)) -1 -1)])
    (sift-down! vec n i))
  (for ([end (in-range (sub1 n) 0 -1)])
    (define tmp (vector-ref vec 0))
    (vector-set! vec 0 (vector-ref vec end))
    (vector-set! vec end tmp)
    (sift-down! vec end 0))
  vec)

(displayln (heap-sort! (vector 5 2 9 1 5 6 -3)))

#lang racket

(define (swap! vec i j)
  (define tmp (vector-ref vec i))
  (vector-set! vec i (vector-ref vec j))
  (vector-set! vec j tmp))

(define (sift-down! vec root end)
  (define left (+ (* 2 root) 1))
  (define right (+ (* 2 root) 2))
  (define largest root)
  (when (and (<= left end) (> (vector-ref vec left) (vector-ref vec largest)))
    (set! largest left))
  (when (and (<= right end) (> (vector-ref vec right) (vector-ref vec largest)))
    (set! largest right))
  (unless (= largest root)
    (swap! vec root largest)
    (sift-down! vec largest end)))

(define (heap-sort! vec)
  (define n (vector-length vec))
  (for ([start (in-range (sub1 (quotient n 2)) -1 -1)])
    (sift-down! vec start (sub1 n)))
  (for ([end (in-range (sub1 n) 0 -1)])
    (swap! vec 0 end)
    (sift-down! vec 0 (sub1 end)))
  vec)

(displayln (heap-sort! (vector 5 3 8 1 9 2 7)))

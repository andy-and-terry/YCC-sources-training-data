#lang racket

;; A monotonic deque of indices, kept in decreasing order of value,
;; finds every window's maximum in O(n) total: the front is always the
;; current window's max, and each index enters and leaves the deque
;; at most once.
(define (sliding-window-max lst k)
  (define vec (list->vector lst))
  (define n (vector-length vec))
  (define dq '()) ; front (oldest / current max) at the head, back (newest) at the tail
  (define result '())

  (define (push-back! i) (set! dq (append dq (list i))))
  (define (pop-back!) (set! dq (reverse (cdr (reverse dq)))))
  (define (pop-front!) (set! dq (cdr dq)))

  (for ([i (in-range n)])
    (when (and (not (null? dq)) (<= (car dq) (- i k)))
      (pop-front!))
    (let loop ()
      (when (and (not (null? dq)) (<= (vector-ref vec (last dq)) (vector-ref vec i)))
        (pop-back!)
        (loop)))
    (push-back! i)
    (when (>= i (sub1 k))
      (set! result (cons (vector-ref vec (car dq)) result))))

  (reverse result))

(displayln (sliding-window-max '(1 3 -1 -3 5 3 6 7) 3))
(displayln (sliding-window-max '(9 8 7 6 5) 2))

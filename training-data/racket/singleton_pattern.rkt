#lang racket

;; A module-level singleton: `get-instance` always hands back the same
;; mutable box, created lazily on first use.
(define instance-box (box #f))

(define (get-instance)
  (unless (unbox instance-box)
    (set-box! instance-box (box (list 'created-at (current-seconds) 'count 0))))
  (unbox instance-box))

(define (increment-count!)
  (define inst (get-instance))
  (define state (unbox inst))
  (set-box! inst (list 'created-at (cadr state) 'count (+ 1 (cadddr state)))))

(define a (get-instance))
(define b (get-instance))

(displayln (eq? a b))
(increment-count!)
(increment-count!)
(displayln (unbox (get-instance)))

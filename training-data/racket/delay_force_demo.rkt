#lang racket

;; delay/force: a promise defers a computation until its value is
;; actually needed, then caches the result -- the body runs once.
(define expensive
  (delay
    (displayln "computing...")
    (+ 1 2 3 4 5)))

(displayln "promise created, nothing computed yet")
(displayln (force expensive))
(displayln (force expensive))  ;; cached, no re-print of "computing..."

;; make-promise wraps an already-known value with no deferred work.
(define ready (make-promise 42))
(displayln (force ready))

;; A lazy fibonacci built from chained promises.
(define (lazy-fib n)
  (if (<= n 1)
      (delay n)
      (delay (+ (force (lazy-fib (- n 1))) (force (lazy-fib (- n 2)))))))

(displayln (force (lazy-fib 10)))

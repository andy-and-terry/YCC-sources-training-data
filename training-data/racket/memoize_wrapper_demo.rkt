#lang racket

;; A generic memoizer: wraps any single-argument function in a
;; closure over a hash-table cache, so repeated calls with the same
;; argument skip recomputation -- independent of what the function does.
(define (memoize f)
  (define cache (make-hash))
  (lambda (x)
    (if (hash-has-key? cache x)
        (hash-ref cache x)
        (let ([result (f x)])
          (hash-set! cache x result)
          result))))

(define call-count 0)
(define (slow-square x)
  (set! call-count (add1 call-count))
  (* x x))

(define fast-square (memoize slow-square))

(displayln (fast-square 5))
(displayln (fast-square 5))
(displayln (fast-square 6))
(displayln call-count)

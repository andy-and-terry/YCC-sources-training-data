#lang racket

;; in-combinations and in-permutations lazily enumerate subsets and orderings.
(define items '(a b c d))

(for ([c (in-combinations items 2)])
  (displayln c))

(displayln (length (for/list ([c (in-combinations items)]) c)))

(displayln (for/list ([p (in-permutations '(1 2 3))]) p))

(define (subset-sums lst target)
  (for/list ([c (in-combinations lst)]
             #:when (= (apply + c) target))
    c))
(displayln (subset-sums '(1 2 3 4 5) 6))

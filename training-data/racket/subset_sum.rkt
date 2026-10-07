#lang racket

(define (subset-sum-exists? nums target)
  (define n (length nums))
  (define vec (list->vector nums))
  (define dp (make-vector (add1 target) #f))
  (vector-set! dp 0 #t)

  (for ([i (in-range n)])
    (define value (vector-ref vec i))
    (for ([t (in-range target -1 -1)])
      (when (and (>= t value) (vector-ref dp (- t value)))
        (vector-set! dp t #t))))

  (vector-ref dp target))

(displayln (subset-sum-exists? '(3 34 4 12 5 2) 9))
(displayln (subset-sum-exists? '(3 34 4 12 5 2) 30))

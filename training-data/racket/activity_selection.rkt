#lang racket

(define (activity-selection activities)
  (define ordered (sort activities < #:key cdr))
  (define-values (selected _)
    (for/fold ([selected '()] [last-end -inf.0])
              ([activity ordered])
      (define start (car activity))
      (define finish (cdr activity))
      (if (>= start last-end)
          (values (cons activity selected) finish)
          (values selected last-end))))
  (reverse selected))

(define activities '((1 . 4) (3 . 5) (0 . 6) (5 . 7) (3 . 9) (5 . 9) (6 . 10) (8 . 11) (8 . 12) (2 . 14) (12 . 16)))
(displayln (activity-selection activities))

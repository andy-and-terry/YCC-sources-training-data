;; Bucket sort for floating-point values in [0, 1): scatter into buckets,
;; sort each bucket, then concatenate.

(define (insert-sorted x lst)
  (cond
    ((null? lst) (list x))
    ((<= x (car lst)) (cons x lst))
    (else (cons (car lst) (insert-sorted x (cdr lst))))))

(define (bucket-sort values)
  (let* ((n (length values))
         (buckets (make-vector n '())))
    (for-each
     (lambda (x)
       (let ((index (min (- n 1) (inexact->exact (floor (* x n))))))
         (vector-set! buckets index (insert-sorted x (vector-ref buckets index)))))
     values)
    (apply append (vector->list buckets))))

(display (bucket-sort '(0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68)))
(newline)

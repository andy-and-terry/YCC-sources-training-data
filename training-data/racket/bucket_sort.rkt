#lang racket

(define (bucket-sort arr bucket-count)
  (if (null? arr)
      arr
      (let* ([min-val (apply min arr)]
             [max-val (apply max arr)]
             [range-val (max (- max-val min-val) 0.0001)]
             [buckets (make-vector bucket-count '())])
        (for ([v arr])
          (define idx (min (sub1 bucket-count)
                            (inexact->exact (floor (* (/ (- v min-val) range-val) bucket-count)))))
          (vector-set! buckets idx (cons v (vector-ref buckets idx))))
        (apply append (for/list ([b buckets]) (sort b <))))))

(displayln (bucket-sort '(0.42 0.32 0.23 0.52 0.25 0.47 0.51) 5))

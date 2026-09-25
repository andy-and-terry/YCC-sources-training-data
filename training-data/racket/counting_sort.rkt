#lang racket

;; Counting sort assumes a bounded range of non-negative integers and
;; sorts by tallying occurrences instead of comparing elements.
(define (counting-sort lst)
  (define maximum (apply max lst))
  (define counts (make-vector (add1 maximum) 0))
  (for ([x lst]) (vector-set! counts x (add1 (vector-ref counts x))))
  (for*/list ([v (in-range (add1 maximum))]
              [_ (in-range (vector-ref counts v))])
    v))

(displayln (counting-sort '(4 2 2 8 3 3 1)))

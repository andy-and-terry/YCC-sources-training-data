#lang racket
;; for/fold with several accumulators returns multiple values.

(define nums '(3 -1 4 -1 5 -9 2 6))

;; Track sum, count of negatives, and max in a single pass.
(define-values (sum negs biggest)
  (for/fold ([sum 0] [negs 0] [biggest -inf.0]) ([n (in-list nums)])
    (values (+ sum n)
            (if (negative? n) (add1 negs) negs)
            (max biggest n))))
(printf "sum=~a negatives=~a max=~a\n" sum negs biggest)

;; #:result (Racket 8+) post-processes the accumulators.
(define mean
  (for/fold ([total 0] [cnt 0] #:result (/ total cnt)) ([n nums])
    (values (+ total n) (add1 cnt))))
(printf "mean=~a\n" mean)

;; Single accumulator building a hash.
(define freq
  (for/fold ([h (hash)]) ([c (in-string "mississippi")])
    (hash-update h c add1 0)))
(printf "~a\n" (sort (hash->list freq) char<? #:key car))

;; #:break stops early.
(define first-three-sum
  (for/fold ([s 0]) ([n (in-naturals 1)] #:break (> n 3))
    (+ s n)))
(printf "first-three-sum=~a\n" first-three-sum)

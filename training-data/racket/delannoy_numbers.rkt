#lang racket
;; D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1), memoised with a hash.
(define memo (make-hash))
(define (delannoy m n)
  (hash-ref! memo (cons m n)
             (λ () (if (or (zero? m) (zero? n))
                       1
                       (+ (delannoy (sub1 m) n) (delannoy m (sub1 n)) (delannoy (sub1 m) (sub1 n)))))))
(displayln (for/list ([n 6]) (delannoy n n))) ; (1 3 13 63 321 1683)

#lang racket

;; Counting with immutable and mutable hashes using hash-update.
(define (count-items items)
  (for/fold ([counts (hash)]) ([x items])
    (hash-update counts x add1 0)))

(define counts (count-items '(a b a c b a)))
(displayln (sort (hash->list counts) > #:key cdr))

(define groups (make-hash))
(for ([w '("apple" "avocado" "banana" "blueberry" "cherry")])
  (hash-update! groups (string-ref w 0) (lambda (lst) (cons w lst)) '()))
(for ([k (sort (hash-keys groups) char<?)])
  (printf "~a: ~a\n" k (reverse (hash-ref groups k))))

(displayln (hash-ref counts 'z 'missing))
(displayln (hash-ref counts 'z (lambda () 0)))

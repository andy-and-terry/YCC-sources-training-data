#lang racket

;; LSD radix sort repeatedly bucket-sorts by one decimal digit at a
;; time, from least to most significant, using stable per-digit
;; buckets so earlier passes' order is preserved.
(define (digit n place) (modulo (quotient n place) 10))

(define (bucket-by-digit lst place)
  (define buckets (make-vector 10 '()))
  (for ([x lst])
    (define d (digit x place))
    (vector-set! buckets d (cons x (vector-ref buckets d))))
  (append* (for/list ([b buckets]) (reverse b))))

(define (radix-sort lst)
  (define max-val (apply max lst))
  (let loop ([place 1] [current lst])
    (if (> place max-val)
        current
        (loop (* place 10) (bucket-by-digit current place)))))

(displayln (radix-sort '(170 45 75 90 802 24 2 66)))

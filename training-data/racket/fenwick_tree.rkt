#lang racket

(struct fenwick (vec n) #:mutable)

(define (make-fenwick n)
  (fenwick (make-vector (+ n 1) 0) n))

(define (fenwick-update! fen index delta)
  (define tree (fenwick-vec fen))
  (let loop ([i index])
    (when (<= i (fenwick-n fen))
      (vector-set! tree i (+ (vector-ref tree i) delta))
      (loop (+ i (bitwise-and i (- i)))))))

(define (fenwick-prefix-sum fen index)
  (define tree (fenwick-vec fen))
  (let loop ([i index] [total 0])
    (if (<= i 0)
        total
        (loop (- i (bitwise-and i (- i))) (+ total (vector-ref tree i))))))

(define (fenwick-range-sum fen l r)
  (- (fenwick-prefix-sum fen r) (fenwick-prefix-sum fen (sub1 l))))

(define values (vector 3 2 -1 6 5 4 -3 3 7 2))
(define fen (make-fenwick (vector-length values)))
(for ([i (in-range (vector-length values))])
  (fenwick-update! fen (add1 i) (vector-ref values i)))

(displayln (fenwick-range-sum fen 1 5))
(fenwick-update! fen 3 10)
(displayln (fenwick-range-sum fen 1 5))

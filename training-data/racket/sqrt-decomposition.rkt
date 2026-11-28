#lang racket
(define a (vector 5 3 8 1 9 2 7 4 6 0 3 5))
(define bs 4)
(define blk (make-vector 3 0))
(for ([i (in-range 12)])
  (vector-set! blk (quotient i bs) (+ (vector-ref blk (quotient i bs)) (vector-ref a i))))

(define (query l r)
  (let loop ([i l] [s 0])
    (cond [(> i r) s]
          [(and (zero? (modulo i bs)) (<= (+ i bs -1) r))
           (loop (+ i bs) (+ s (vector-ref blk (quotient i bs))))]
          [else (loop (add1 i) (+ s (vector-ref a i)))])))

(displayln (query 2 9))

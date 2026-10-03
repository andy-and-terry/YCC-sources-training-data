#lang racket

(define (matrix-chain-order dims)
  (define n (sub1 (vector-length dims)))
  (define dp (make-vector (* n n) 0))
  (define (ref i j) (vector-ref dp (+ (* i n) j)))
  (define (set-dp! i j v) (vector-set! dp (+ (* i n) j) v))

  (for ([chain-len (in-range 2 (add1 n))])
    (for ([i (in-range 0 (add1 (- n chain-len)))])
      (define j (+ i chain-len -1))
      (set-dp! i j +inf.0)
      (for ([k (in-range i j)])
        (define cost (+ (ref i k) (ref (add1 k) j)
                         (* (vector-ref dims i) (vector-ref dims (add1 k)) (vector-ref dims (add1 j)))))
        (when (< cost (ref i j)) (set-dp! i j cost)))))

  (ref 0 (sub1 n)))

;; Matrices of dimensions 40x20, 20x30, 30x10, 10x30
(displayln (matrix-chain-order (vector 40 20 30 10 30)))

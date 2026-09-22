(define (matrix-chain-order dims)
  (define n (- (length dims) 1))
  (define dim-vec (list->vector dims))
  (define cost (make-vector (* (+ n 1) (+ n 1)) 0))

  (define (idx i j) (+ (* i (+ n 1)) j))
  (define (cost-ref i j) (vector-ref cost (idx i j)))
  (define (cost-set! i j v) (vector-set! cost (idx i j) v))

  (let loop-len ((len 2))
    (if (<= len n)
        (begin
          (let loop-i ((i 1))
            (if (<= i (- n len -1))
                (let ((j (+ i len -1)))
                  (cost-set! i j
                    (let loop-k ((k i) (best #f))
                      (if (> k (- j 1))
                          best
                          (let ((candidate (+ (cost-ref i k)
                                               (cost-ref (+ k 1) j)
                                               (* (vector-ref dim-vec (- i 1))
                                                  (vector-ref dim-vec k)
                                                  (vector-ref dim-vec j)))))
                            (loop-k (+ k 1) (if (or (not best) (< candidate best)) candidate best))))))
                  (loop-i (+ i 1)))))
          (loop-len (+ len 1)))))
  (cost-ref 1 n))

(display (matrix-chain-order '(40 20 30 10 30)))
(newline)

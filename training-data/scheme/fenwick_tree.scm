(define (make-fenwick n) (make-vector (+ n 1) 0))

(define (fenwick-update! tree i delta)
  (let loop ((idx (+ i 1)))
    (if (< idx (vector-length tree))
        (begin
          (vector-set! tree idx (+ (vector-ref tree idx) delta))
          (loop (+ idx (bitwise-and idx (- idx))))))))

(define (fenwick-prefix-sum tree i)
  (let loop ((idx (+ i 1)) (sum 0))
    (if (> idx 0)
        (loop (- idx (bitwise-and idx (- idx))) (+ sum (vector-ref tree idx)))
        sum)))

(define (fenwick-range-sum tree l r)
  (- (fenwick-prefix-sum tree r)
     (if (= l 0) 0 (fenwick-prefix-sum tree (- l 1)))))

(define (build-fenwick values)
  (let ((tree (make-fenwick (vector-length values))))
    (let loop ((i 0))
      (if (< i (vector-length values))
          (begin
            (fenwick-update! tree i (vector-ref values i))
            (loop (+ i 1)))))
    tree))

(define arr #(1 3 5 7 9 11))
(define tree (build-fenwick arr))
(display (fenwick-prefix-sum tree 3))
(newline)
(display (fenwick-range-sum tree 1 4))
(newline)

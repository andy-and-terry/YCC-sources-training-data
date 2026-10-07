(define inf 1000000)

(define (make-matrix n init)
  (let ((m (make-vector n)))
    (let loop ((i 0))
      (if (< i n)
          (begin
            (vector-set! m i (make-vector n init))
            (loop (+ i 1)))))
    m))

(define (mref m i j) (vector-ref (vector-ref m i) j))
(define (mset! m i j v) (vector-set! (vector-ref m i) j v))

(define (floyd-warshall edges n)
  (let ((dist (make-matrix n inf)))
    (let loop ((i 0))
      (if (< i n) (begin (mset! dist i i 0) (loop (+ i 1)))))
    (for-each (lambda (e) (mset! dist (car e) (cadr e) (caddr e))) edges)
    (let k-loop ((k 0))
      (if (< k n)
          (begin
            (let i-loop ((i 0))
              (if (< i n)
                  (begin
                    (let j-loop ((j 0))
                      (if (< j n)
                          (begin
                            (if (< (+ (mref dist i k) (mref dist k j)) (mref dist i j))
                                (mset! dist i j (+ (mref dist i k) (mref dist k j))))
                            (j-loop (+ j 1)))))
                    (i-loop (+ i 1)))))
            (k-loop (+ k 1)))))
    dist))

(define edges '((0 1 3) (1 2 1) (0 2 10) (2 3 2) (1 3 7)))
(define result (floyd-warshall edges 4))

(display (mref result 0 3))
(newline)
(display (mref result 0 2))
(newline)

;; Shell sort: insertion sort generalized with a shrinking gap sequence.

(define (shell-sort! vec)
  (define n (vector-length vec))
  (let gap-loop ((gap (quotient n 2)))
    (if (> gap 0)
        (begin
          (let outer ((i gap))
            (if (< i n)
                (let ((temp (vector-ref vec i)))
                  (let inner ((j i))
                    (if (and (>= (- j gap) 0) (> (vector-ref vec (- j gap)) temp))
                        (begin
                          (vector-set! vec j (vector-ref vec (- j gap)))
                          (inner (- j gap)))
                        (vector-set! vec j temp)))
                  (outer (+ i 1)))))
          (gap-loop (quotient gap 2)))))
  vec)

(define v (vector 9 5 1 4 3 8 2 7 6))
(display (shell-sort! v))
(newline)

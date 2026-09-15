(define (lcs-length a b)
  (define la (string-length a))
  (define lb (string-length b))
  (define table (make-vector (* (+ la 1) (+ lb 1)) 0))

  (define (idx i j) (+ (* i (+ lb 1)) j))
  (define (ref i j) (vector-ref table (idx i j)))
  (define (set! i j v) (vector-set! table (idx i j) v))

  (let loop-i ((i 1))
    (if (<= i la)
        (begin
          (let loop-j ((j 1))
            (if (<= j lb)
                (begin
                  (if (char=? (string-ref a (- i 1)) (string-ref b (- j 1)))
                      (set! i j (+ 1 (ref (- i 1) (- j 1))))
                      (set! i j (max (ref (- i 1) j) (ref i (- j 1)))))
                  (loop-j (+ j 1)))))
          (loop-i (+ i 1)))))
  (ref la lb))

(display (lcs-length "abcde" "ace"))
(newline)
(display (lcs-length "abc" "abc"))
(newline)

;; Sparse table for range-minimum queries: O(n log n) preprocessing (each
;; level doubles the window size via dynamic-programming overlap) gives
;; O(1) min queries over any range, at the cost of being static (no updates).

(define (log2-floor n)
  (let loop ((n n) (k 0))
    (if (<= n 1) k (loop (quotient n 2) (+ k 1)))))

(define (build-sparse-table arr)
  (define n (vector-length arr))
  (define k (+ (log2-floor n) 1))
  (define table (make-vector k))
  (vector-set! table 0 (vector-copy arr))
  (do ((j 1 (+ j 1)))
      ((= j k) table)
    (let* ((prev (vector-ref table (- j 1)))
           (half (expt 2 (- j 1)))
           (lvl-len (max 0 (+ (- n (expt 2 j)) 1)))
           (cur (make-vector lvl-len 0)))
      (do ((i 0 (+ i 1)))
          ((= i lvl-len))
        (vector-set! cur i (min (vector-ref prev i) (vector-ref prev (+ i half)))))
      (vector-set! table j cur))))

;; Query the minimum over the inclusive range [lo, hi] using two
;; overlapping windows of the largest power-of-two size that fits.
(define (query-min table lo hi)
  (define len (+ (- hi lo) 1))
  (define k (log2-floor len))
  (define level (vector-ref table k))
  (min (vector-ref level lo) (vector-ref level (- (+ hi 1) (expt 2 k)))))

(define data (vector 5 2 4 7 6 3 1 8))
(define table (build-sparse-table data))

(display (query-min table 2 6))
(newline)
(display (query-min table 0 7))
(newline)
(display (query-min table 4 5))
(newline)

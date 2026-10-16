;; Binary search over a sorted vector, returning index or #f.

(define (vector-bsearch vec target)
  (let loop ((lo 0) (hi (- (vector-length vec) 1)))
    (if (> lo hi)
        #f
        (let* ((mid (quotient (+ lo hi) 2))
               (v (vector-ref vec mid)))
          (cond ((= v target) mid)
                ((< v target) (loop (+ mid 1) hi))
                (else (loop lo (- mid 1))))))))

(define data (vector 2 5 8 12 16 23 38 56 72 91))

(display (vector-bsearch data 23)) (newline)
(display (vector-bsearch data 2)) (newline)
(display (vector-bsearch data 91)) (newline)
(display (vector-bsearch data 7)) (newline)

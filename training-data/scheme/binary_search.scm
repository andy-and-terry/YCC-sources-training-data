(define (binary-search vec target)
  (let loop ((low 0) (high (- (vector-length vec) 1)))
    (if (> low high)
        -1
        (let ((mid (quotient (+ low high) 2)))
          (cond
            ((= (vector-ref vec mid) target) mid)
            ((< (vector-ref vec mid) target) (loop (+ mid 1) high))
            (else (loop low (- mid 1))))))))

(display (binary-search #(1 3 5 7 9 11 13) 7))
(newline)
(display (binary-search #(1 3 5 7 9 11 13) 4))
(newline)

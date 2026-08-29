(define (binary-search vec low high target)
  (if (> low high)
      -1
      (let ((mid (quotient (+ low high) 2)))
        (cond
          ((= (vector-ref vec mid) target) mid)
          ((< (vector-ref vec mid) target) (binary-search vec (+ mid 1) high target))
          (else (binary-search vec low (- mid 1) target))))))

(display (binary-search #(1 3 5 7 9 11) 0 5 7))
(newline)

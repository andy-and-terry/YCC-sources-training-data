(define (digit-square-sum n)
  (let loop ((m (abs n)) (sum 0))
    (if (= m 0)
        sum
        (let ((d (remainder m 10)))
          (loop (quotient m 10) (+ sum (* d d)))))))

(display (digit-square-sum 123)) (newline)
(display (digit-square-sum -99)) (newline)

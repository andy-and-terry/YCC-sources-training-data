;; Population count (number of set bits) for 0..15
(define (bits n)
  (if (= n 0) 0 (+ (remainder n 2) (bits (quotient n 2)))))

(let loop ((n 0))
  (when (< n 16)
    (display (bits n))
    (display " ")
    (loop (+ n 1))))
(newline)

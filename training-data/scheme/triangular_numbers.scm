(define (triangular count)
  (let loop ((n 1) (sum 0) (acc '()))
    (if (> n count)
        (reverse acc)
        (loop (+ n 1) (+ sum n) (cons (+ sum n) acc)))))

(display (triangular 10))
(newline)

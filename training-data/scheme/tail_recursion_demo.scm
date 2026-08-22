(define (sum-to n)
  (let loop ((i 1) (acc 0))
    (if (> i n) acc (loop (+ i 1) (+ acc i)))))

(display (sum-to 100))
(newline)

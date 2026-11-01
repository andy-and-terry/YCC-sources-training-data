;; Ways to write n as a sum of two or more consecutive positive integers.
(define (polite-ways n)
  (let loop ((k 2) (ways 0))
    (if (> (quotient (* k (+ k 1)) 2) n)
        ways
        (loop (+ k 1)
              (if (zero? (remainder (- n (quotient (* k (- k 1)) 2)) k))
                  (+ ways 1)
                  ways)))))

(let loop ((n 1))
  (when (<= n 16)
    (display (polite-ways n))
    (display " ")
    (loop (+ n 1))))
(newline)

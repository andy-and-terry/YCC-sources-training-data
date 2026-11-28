(define (popcount n)
  (let loop ((n n) (c 0))
    (if (= n 0)
        c
        (loop (bitwise-and n (- n 1)) (+ c 1)))))

(display (popcount 183))
(newline)

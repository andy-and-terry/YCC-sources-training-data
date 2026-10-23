(define (sum-to n)
  (let loop ((i 1) (acc 0))
    (if (> i n)
        acc
        (loop (+ i 1) (+ acc i)))))

(display (sum-to 100))
(newline)

(define (digits n)
  (let loop ((n n) (acc '()))
    (if (< n 10)
        (cons n acc)
        (loop (quotient n 10) (cons (remainder n 10) acc)))))

(display (digits 9071))
(newline)

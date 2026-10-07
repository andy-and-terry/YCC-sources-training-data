;; Collatz sequence and its length
(define (collatz-next n)
  (if (even? n) (quotient n 2) (+ (* 3 n) 1)))

(define (collatz-seq n)
  (let loop ((n n) (acc '()))
    (if (= n 1)
        (reverse (cons 1 acc))
        (loop (collatz-next n) (cons n acc)))))

(display (collatz-seq 6)) (newline)
(display (length (collatz-seq 27))) (newline)

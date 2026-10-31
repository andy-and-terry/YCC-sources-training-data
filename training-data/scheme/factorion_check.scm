(define (fact k) (if (= k 0) 1 (* k (fact (- k 1)))))

(define (factorion? n)
  (let loop ((m n) (sum 0))
    (if (= m 0)
        (= sum n)
        (loop (quotient m 10) (+ sum (fact (remainder m 10)))))))

(do ((n 1 (+ n 1))) ((>= n 50000))
  (if (factorion? n) (begin (display n) (display " "))))
(newline)

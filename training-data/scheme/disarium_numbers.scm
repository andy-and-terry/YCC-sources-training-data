;; Disarium numbers: digits raised to their 1-based positions sum to n.
(define (digits n)
  (if (< n 10) (list n)
      (append (digits (quotient n 10)) (list (remainder n 10)))))

(define (disarium? n)
  (let loop ((ds (digits n)) (i 1) (sum 0))
    (if (null? ds)
        (= sum n)
        (loop (cdr ds) (+ i 1) (+ sum (expt (car ds) i))))))

(do ((n 1 (+ n 1))) ((>= n 1000))
  (if (disarium? n) (begin (display n) (display " "))))
(newline)

;; Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
(define (munchausen? n)
  (let loop ((m n) (sum 0))
    (if (= m 0)
        (= sum n)
        (let ((d (remainder m 10)))
          (loop (quotient m 10)
                (+ sum (if (= d 0) 0 (expt d d))))))))

(do ((n 1 (+ n 1))) ((>= n 5000))
  (if (munchausen? n) (begin (display n) (display " "))))
(newline)

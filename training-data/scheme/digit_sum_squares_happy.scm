;; Sum of squared digits, used to detect "happy" numbers by iteration.

(define (digit-square-sum n)
  (if (= n 0)
      0
      (let ((d (remainder n 10)))
        (+ (* d d) (digit-square-sum (quotient n 10))))))

(define (happy? n)
  (let loop ((x n) (seen '()))
    (cond ((= x 1) #t)
          ((memv x seen) #f)
          (else (loop (digit-square-sum x) (cons x seen))))))

(define (filter-range pred lo hi)
  (let loop ((i hi) (acc '()))
    (if (< i lo) acc (loop (- i 1) (if (pred i) (cons i acc) acc)))))

(display (digit-square-sum 123)) (newline)
(display (filter-range happy? 1 50)) (newline)

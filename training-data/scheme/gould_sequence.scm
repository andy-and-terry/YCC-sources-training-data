(define (popcount n)
  (if (= n 0) 0 (+ (modulo n 2) (popcount (quotient n 2)))))

(define (gould n) (expt 2 (popcount n)))

(do ((n 0 (+ n 1))) ((= n 16))
  (display (gould n)) (display " "))
(newline)

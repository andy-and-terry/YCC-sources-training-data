;; D(m,n) = D(m-1,n) + D(m,n-1) + D(m-1,n-1)
(define (delannoy m n)
  (if (or (zero? m) (zero? n))
      1
      (+ (delannoy (- m 1) n) (delannoy m (- n 1)) (delannoy (- m 1) (- n 1)))))

(let loop ((n 0))
  (when (<= n 5)
    (display (delannoy n n)) (display " ")
    (loop (+ n 1))))
(newline) ; 1 3 13 63 321 1683

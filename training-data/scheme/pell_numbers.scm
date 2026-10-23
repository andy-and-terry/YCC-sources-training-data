;; P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
(define (pell count)
  (let loop ((n count) (a 0) (b 1))
    (if (= n 0)
        '()
        (cons a (loop (- n 1) b (+ (* 2 b) a))))))

(let loop ((ps (pell 15)) (i 0))
  (if (pair? ps)
      (begin
        (display "P(") (display i) (display ") = ") (display (car ps)) (newline)
        (loop (cdr ps) (+ i 1)))))

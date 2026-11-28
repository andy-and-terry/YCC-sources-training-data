(define (fact n) (if (< n 2) 1 (* n (fact (- n 1)))))
(define (comb n k) (quotient (fact n) (* (fact k) (fact (- n k)))))
(define (lah n k) (quotient (* (comb (- n 1) (- k 1)) (fact n)) (fact k)))

(do ((n 1 (+ n 1))) ((> n 5))
  (do ((k 1 (+ k 1))) ((> k n))
    (display (lah n k)) (display " "))
  (newline))

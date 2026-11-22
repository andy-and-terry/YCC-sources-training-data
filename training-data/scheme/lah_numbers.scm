;; Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
(define (fact n) (if (<= n 1) 1 (* n (fact (- n 1)))))
(define (comb n k) (quotient (fact n) (* (fact k) (fact (- n k)))))

(define n 5)
(do ((k 1 (+ k 1))) ((> k n))
  (display (quotient (* (comb (- n 1) (- k 1)) (fact n)) (fact k)))
  (display " "))
(newline)

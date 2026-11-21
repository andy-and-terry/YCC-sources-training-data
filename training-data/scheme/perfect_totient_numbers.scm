;; Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
(define (phi n)
  (let loop ((k 1) (c 0))
    (cond ((> k n) c)
          ((= 1 (gcd k n)) (loop (+ k 1) (+ c 1)))
          (else (loop (+ k 1) c)))))

(define (chain-sum m)
  (if (<= m 1) 0 (+ (phi m) (chain-sum (phi m)))))

(do ((n 2 (+ n 1))) ((>= n 200))
  (if (= n (chain-sum n)) (begin (display n) (display " "))))
(newline)

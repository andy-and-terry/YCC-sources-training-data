(define (my-gcd a b)
  (if (= b 0) (abs a) (my-gcd b (remainder a b))))

(define (my-lcm a b)
  (quotient (abs (* a b)) (my-gcd a b)))

(display (my-gcd 48 18))
(newline)
(display (my-lcm 4 6))
(newline)

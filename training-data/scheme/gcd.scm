(define (my-gcd a b)
  (if (= b 0) a (my-gcd b (modulo a b))))

(display (my-gcd 48 18))
(newline)
(display (my-gcd 100 75))
(newline)

(define (gcd2 a b) (if (= b 0) (abs a) (gcd2 b (remainder a b))))

(define (gcd-all nums) (fold-left gcd2 0 nums))

(display (gcd-all '(12 18 24))) (newline)
(display (gcd-all '(7 13))) (newline)

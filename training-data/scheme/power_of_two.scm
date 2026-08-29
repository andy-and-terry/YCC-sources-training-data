(define (power-of-two? n)
  (and (> n 0) (= 0 (bitwise-and n (- n 1)))))

(display (power-of-two? 16))
(newline)
(display (power-of-two? 18))
(newline)

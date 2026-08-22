(define (fibonacci n)
  (let loop ((a 0) (b 1) (i 0))
    (if (= i n) a (loop b (+ a b) (+ i 1)))))

(display (map fibonacci (iota 10)))
(newline)

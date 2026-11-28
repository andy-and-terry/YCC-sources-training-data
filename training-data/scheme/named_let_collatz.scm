(define (collatz n)
  (let loop ((n n) (steps 0))
    (cond ((= n 1) steps)
          ((even? n) (loop (quotient n 2) (+ steps 1)))
          (else (loop (+ (* 3 n) 1) (+ steps 1))))))

(display (collatz 27))
(newline)

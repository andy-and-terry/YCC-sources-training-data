(define (my-power base exp)
  (cond
    ((= exp 0) 1)
    ((even? exp) (let ((half (my-power base (quotient exp 2)))) (* half half)))
    (else (* base (my-power base (- exp 1))))))

(display (my-power 2 10))
(newline)
(display (my-power 3 5))
(newline)

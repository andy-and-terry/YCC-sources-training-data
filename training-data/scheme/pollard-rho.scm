(define (rho n)
  (define (f v) (modulo (+ (* v v) 1) n))
  (if (even? n)
      2
      (let loop ((x 2) (y 2))
        (let* ((x1 (f x)) (y1 (f (f y))) (d (gcd (abs (- x1 y1)) n)))
          (if (= d 1) (loop x1 y1) d)))))

(let* ((n 8051) (p (rho n)))
  (display n) (display " = ") (display p) (display " * ") (display (quotient n p)) (newline))

(define (chebyshev a b)
  (apply max (map (lambda (x y) (abs (- x y))) a b)))

(display (chebyshev '(1 2) '(4 6)))
(newline)

(define (compose f g) (lambda (x) (f (g x))))

(define add-one (lambda (x) (+ x 1)))
(define double (lambda (x) (* x 2)))
(define add-one-then-double (compose double add-one))

(display (add-one-then-double 3))
(newline)

(display (map (lambda (x) (* x x)) '(1 2 3 4 5)))
(newline)

(display (fold-left + 0 '(1 2 3 4 5)))
(newline)

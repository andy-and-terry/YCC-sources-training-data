;; The applicative-order Y combinator: recursion without define-ing a name.

(define Y
  (lambda (f)
    ((lambda (x) (f (lambda (v) ((x x) v))))
     (lambda (x) (f (lambda (v) ((x x) v)))))))

(define factorial
  (Y (lambda (self)
       (lambda (n)
         (if (< n 2) 1 (* n (self (- n 1))))))))

(define fib
  (Y (lambda (self)
       (lambda (n)
         (if (< n 2) n (+ (self (- n 1)) (self (- n 2))))))))

(display (factorial 10)) (newline)
(display (map fib '(0 1 2 3 4 5 6 7 8 9))) (newline)

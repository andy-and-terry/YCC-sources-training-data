;; Fast exponentiation, also applied to repeated function composition.

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (let ((h (fast-expt b (quotient n 2)))) (* h h)))
        (else (* b (fast-expt b (- n 1))))))

(define (compose f g) (lambda (x) (f (g x))))

(define (repeated f n)
  (cond ((= n 0) (lambda (x) x))
        ((even? n) (let ((h (repeated f (quotient n 2)))) (compose h h)))
        (else (compose f (repeated f (- n 1))))))

(display (fast-expt 2 30)) (newline)
(display (fast-expt 3 13)) (newline)
(display ((repeated (lambda (x) (* x 2)) 10) 1)) (newline)
(display ((repeated (lambda (x) (+ x 3)) 7) 0)) (newline)

(define result-let
  (let ((x 1) (y 2)) (+ x y)))

(define result-let*
  (let* ((x 1) (y (+ x 1))) (+ x y)))

(define result-letrec
  (letrec ((even2? (lambda (n) (if (= n 0) #t (odd2? (- n 1)))))
           (odd2? (lambda (n) (if (= n 0) #f (even2? (- n 1))))))
    (even2? 10)))

(display result-let)
(newline)
(display result-let*)
(newline)
(display result-letrec)
(newline)

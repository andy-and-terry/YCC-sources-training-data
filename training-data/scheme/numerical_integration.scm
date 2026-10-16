;; Numerical integration with the midpoint rule and Simpson's rule.

(define (sum term a next b)
  (if (> a b) 0 (+ (term a) (sum term (next a) next b))))

(define (midpoint f a b n)
  (let ((h (/ (- b a) n)))
    (* h (sum f (+ a (/ h 2)) (lambda (x) (+ x h)) (- b (/ h 2.0))))))

(define (simpson f a b n)
  (let* ((h (/ (- b a) n))
         (y (lambda (k) (f (+ a (* k h)))))
         (term (lambda (k)
                 (* (cond ((or (= k 0) (= k n)) 1)
                          ((odd? k) 4)
                          (else 2))
                    (y k)))))
    (* (/ h 3) (sum term 0 (lambda (k) (+ k 1)) n))))

(define (cube x) (* x x x))

(display (midpoint cube 0 1 100)) (newline)
(display (simpson cube 0 1 100)) (newline)
(display (simpson sin 0 3.14159265 100)) (newline)

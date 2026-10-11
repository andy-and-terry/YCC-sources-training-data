;; Fixed points, Newton's method and average damping.

(define tolerance 0.00001)

(define (fixed-point f guess)
  (let loop ((g guess))
    (let ((next (f g)))
      (if (< (abs (- next g)) tolerance)
          next
          (loop next)))))

(define (average a b) (/ (+ a b) 2))

(define (sqrt* x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

(define (cube-root x)
  (fixed-point (lambda (y) (/ (+ (* 2 y) (/ x (* y y))) 3)) 1.0))

(display (sqrt* 2)) (newline)
(display (sqrt* 144)) (newline)
(display (cube-root 27)) (newline)
(display (fixed-point cos 1.0)) (newline)

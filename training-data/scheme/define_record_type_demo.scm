(define-record-type point
  (make-point x y)
  point?
  (x point-x set-point-x!)
  (y point-y set-point-y!))

(define (point-add a b)
  (make-point (+ (point-x a) (point-x b)) (+ (point-y a) (point-y b))))

(define p1 (make-point 1 2))
(define p2 (make-point 3 4))
(define sum (point-add p1 p2))

(display (point? p1))
(newline)
(display (list (point-x sum) (point-y sum)))
(newline)

(set-point-x! p1 99)
(display (point-x p1))
(newline)

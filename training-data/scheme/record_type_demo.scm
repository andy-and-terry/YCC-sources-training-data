;; R7RS define-record-type for a structured, named data type.

(define-record-type point
  (make-point x y)
  point?
  (x point-x set-point-x!)
  (y point-y set-point-y!))

(define (point-distance a b)
  (let ((dx (- (point-x a) (point-x b)))
        (dy (- (point-y a) (point-y b))))
    (sqrt (+ (* dx dx) (* dy dy)))))

(define p1 (make-point 0 0))
(define p2 (make-point 3 4))

(display (point? p1))
(newline)
(display (point-distance p1 p2))
(newline)

(set-point-x! p1 1)
(display (point-x p1))
(newline)

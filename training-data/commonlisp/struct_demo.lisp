(defstruct point x y)

(defun point-add (a b)
  (make-point :x (+ (point-x a) (point-x b))
              :y (+ (point-y a) (point-y b))))

(let ((p1 (make-point :x 1 :y 2))
      (p2 (make-point :x 3 :y 4)))
  (print (point-add p1 p2)))

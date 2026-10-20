(defstruct point x y)
(defgeneric norm (p))
(defmethod norm ((p point)) (sqrt (+ (expt (point-x p) 2) (expt (point-y p) 2))))
(print (norm (make-point :x 3 :y 4)))

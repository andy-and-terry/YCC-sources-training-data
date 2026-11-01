(defstruct (point (:constructor make-pt (x y))) x y)

(let ((p (make-pt 3 4)))
  (setf (point-x p) 10)
  (print (list (point-x p) (point-y p)))
  (print (point-p p))
  (print (sqrt (+ (expt (point-x p) 2) (expt (point-y p) 2)))))

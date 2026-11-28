(defun chebyshev (a b)
  (reduce #'max (mapcar (lambda (x y) (abs (- x y))) a b)))

(print (chebyshev '(1 2) '(4 6)))

;; Manhattan distance.
(defun manhattan (a b) (reduce #'+ (mapcar (lambda (x y) (abs (- x y))) a b)))
(print (manhattan '(1 2) '(4 6)))

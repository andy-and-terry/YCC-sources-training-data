;; Shoelace polygon area.
(defun area (pts)
  (/ (abs (loop for (a b) on (append pts (list (first pts))) while b
                sum (- (* (first a) (second b)) (* (first b) (second a)))))
     2))
(print (area '((0 0) (4 0) (4 3) (0 3))))

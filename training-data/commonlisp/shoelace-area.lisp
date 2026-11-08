(defun shoelace (pts)
  (/ (abs (loop for (p q) on (append pts (list (first pts)))
                while q
                sum (- (* (car p) (cdr q)) (* (car q) (cdr p)))))
     2))

(format t "~a~%" (shoelace '((0 . 0) (4 . 0) (4 . 3) (0 . 3))))

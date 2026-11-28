(defun area (pts)
  (let ((s 0) (n (length pts)))
    (dotimes (i n)
      (destructuring-bind (x1 y1) (nth i pts)
        (destructuring-bind (x2 y2) (nth (mod (1+ i) n) pts)
          (incf s (- (* x1 y2) (* x2 y1))))))
    (/ (abs s) 2)))

(format t "~a~%" (area '((0 0) (4 0) (4 3) (0 3))))

(defun escape (c)
  (let ((z #C(0.0 0.0)))
    (dotimes (n 30 30)
      (when (>= (abs z) 2) (return n))
      (setf z (+ (* z z) c)))))

(loop for yi from -5 to 5
      do (format t "~a~%"
                 (coerce (loop for xi from -40 to 12
                               collect (if (= 30 (escape (complex (/ xi 20.0) (/ yi 5.0)))) #\# #\.))
                         'string)))

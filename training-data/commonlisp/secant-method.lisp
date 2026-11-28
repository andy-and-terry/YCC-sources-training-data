(defun secant (f x0 x1)
  (dotimes (i 50 x1)
    (let ((f0 (funcall f x0)) (f1 (funcall f x1)))
      (when (= f0 f1) (return x1))
      (let ((next (- x1 (/ (* f1 (- x1 x0)) (- f1 f0)))))
        (setf x0 x1 x1 next)
        (when (< (abs (- x1 x0)) 1d-12) (return x1))))))

(format t "~,10f~%" (secant (lambda (x) (- (* x x) 2d0)) 1d0 2d0))

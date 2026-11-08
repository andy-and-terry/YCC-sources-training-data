(defun secant (f a b)
  (dotimes (i 40 b)
    (let ((fa (funcall f a)) (fb (funcall f b)))
      (when (= fa fb) (return b))
      (psetf a b
             b (- b (/ (* fb (- b a)) (- fb fa)))))))

(format t "~,8f~%" (secant (lambda (x) (- (* x x) 2d0)) 1d0 2d0))

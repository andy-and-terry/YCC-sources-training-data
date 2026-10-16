(defun vector-sums (a b)
  (macrolet ((sum-at (i) `(+ (aref a ,i) (aref b ,i))))
    (loop for i below (length a) collect (sum-at i))))

(format t "~a~%" (vector-sums #(1 2 3) #(10 20 30)))

(defun swap-demo ()
  (let ((x 1) (y 2))
    (macrolet ((swap (p q) `(rotatef ,p ,q)))
      (swap x y)
      (list x y))))

(format t "~a~%" (swap-demo))

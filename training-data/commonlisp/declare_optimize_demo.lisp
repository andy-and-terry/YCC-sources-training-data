(declaim (inline square))
(defun square (x) (* x x))

(defun sum-squares (n)
  (declare (type fixnum n) (optimize (speed 3) (safety 1)))
  (let ((total 0))
    (declare (type (unsigned-byte 62) total))
    (dotimes (i n total)
      (incf total (square i)))))

(format t "~a~%" (sum-squares 1000))

(defun dot (a b)
  (declare (type (simple-array double-float (*)) a b))
  (loop for x across a for y across b sum (* x y) of-type double-float))

(format t "~a~%" (dot (make-array 3 :element-type 'double-float :initial-contents '(1d0 2d0 3d0))
                      (make-array 3 :element-type 'double-float :initial-contents '(4d0 5d0 6d0))))

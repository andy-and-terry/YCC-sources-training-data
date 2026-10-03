(defun pascals-triangle (rows)
  (let ((triangle (make-array rows)))
    (dotimes (r rows)
      (let ((row (make-array (1+ r) :initial-element 1)))
        (loop for c from 1 below r do
          (setf (aref row c)
                (+ (aref (aref triangle (1- r)) (1- c))
                   (aref (aref triangle (1- r)) c))))
        (setf (aref triangle r) row)))
    triangle))

(loop for row across (pascals-triangle 6) do
  (format t "~a~%" (coerce row 'list)))

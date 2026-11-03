(defun make-prefix (values)
  (let ((prefix (make-array (1+ (length values)) :initial-element 0)))
    (loop for v in values
          for i from 0
          do (setf (aref prefix (1+ i)) (+ (aref prefix i) v)))
    prefix))

(defun query (prefix lo hi)
  (- (aref prefix hi) (aref prefix lo)))

(format t "~a~%" (query (make-prefix '(3 1 4 1 5 9 2 6)) 2 5))

(defun catalan-numbers (n)
  (let ((c (make-array (1+ n) :initial-element 0)))
    (setf (aref c 0) 1)
    (loop for i from 1 to n do
      (loop for j from 0 below i do
        (incf (aref c i) (* (aref c j) (aref c (- i 1 j))))))
    c))

(format t "~a~%" (catalan-numbers 10))

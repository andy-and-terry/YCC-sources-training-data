;; Lattice paths with a DP vector.
(defun lattice (n)
  (let ((row (make-array (1+ n) :initial-element 1)))
    (dotimes (k n) (loop for j from 1 to n do (incf (aref row j) (aref row (1- j)))))
    (aref row n)))
(print (lattice 3))

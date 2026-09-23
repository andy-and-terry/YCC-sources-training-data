(defun counting-sort (vec max-val)
  (let ((counts (make-array (1+ max-val) :initial-element 0))
        (result (make-array (length vec))))
    (loop for x across vec do (incf (aref counts x)))
    (loop for i from 1 to max-val do
      (incf (aref counts i) (aref counts (1- i))))
    (loop for i from (1- (length vec)) downto 0 do
      (let ((x (aref vec i)))
        (decf (aref counts x))
        (setf (aref result (aref counts x)) x)))
    result))

(print (counting-sort #(4 2 2 8 3 3 1) 8))

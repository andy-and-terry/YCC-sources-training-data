(defun selection-sort (vec)
  (let ((v (copy-seq vec)))
    (loop for i from 0 below (1- (length v)) do
      (let ((min-idx i))
        (loop for j from (1+ i) below (length v) do
          (when (< (aref v j) (aref v min-idx))
            (setf min-idx j)))
        (rotatef (aref v i) (aref v min-idx))))
    v))

(print (selection-sort #(64 25 12 22 11)))

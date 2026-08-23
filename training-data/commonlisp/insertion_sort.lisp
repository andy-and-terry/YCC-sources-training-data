(defun insertion-sort (vec)
  (let ((v (copy-seq vec)))
    (loop for i from 1 below (length v) do
      (let ((key (aref v i)) (j (1- i)))
        (loop while (and (>= j 0) (> (aref v j) key)) do
          (setf (aref v (1+ j)) (aref v j))
          (decf j))
        (setf (aref v (1+ j)) key)))
    v))

(print (insertion-sort #(12 11 13 5 6)))

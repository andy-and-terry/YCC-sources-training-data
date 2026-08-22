(defun bubble-sort (vec)
  (let ((n (length vec)))
    (dotimes (i n)
      (dotimes (j (- n i 1))
        (when (> (aref vec j) (aref vec (1+ j)))
          (rotatef (aref vec j) (aref vec (1+ j))))))
    vec))

(print (bubble-sort (vector 5 2 9 1 5 6)))

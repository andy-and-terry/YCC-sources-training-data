(defun edit-distance (s1 s2)
  (let* ((m (length s1))
         (n (length s2))
         (dp (make-array (list (1+ m) (1+ n)))))
    (loop for i from 0 to m do (setf (aref dp i 0) i))
    (loop for j from 0 to n do (setf (aref dp 0 j) j))
    (loop for i from 1 to m do
      (loop for j from 1 to n do
        (setf (aref dp i j)
              (if (char= (char s1 (1- i)) (char s2 (1- j)))
                  (aref dp (1- i) (1- j))
                  (1+ (min (aref dp (1- i) j)
                           (aref dp i (1- j))
                           (aref dp (1- i) (1- j))))))))
    (aref dp m n)))

(print (edit-distance "SUNDAY" "SATURDAY"))

(defun lcs-length (a b)
  (let* ((n (length a)) (m (length b))
         (dp (make-array (list (1+ n) (1+ m)) :initial-element 0)))
    (loop for i from 1 to n do
      (loop for j from 1 to m do
        (setf (aref dp i j)
              (if (char= (char a (1- i)) (char b (1- j)))
                  (1+ (aref dp (1- i) (1- j)))
                  (max (aref dp (1- i) j) (aref dp i (1- j)))))))
    (aref dp n m)))

(print (lcs-length "abcde" "ace"))
(print (lcs-length "abc" "abc"))
(print (lcs-length "abc" "xyz"))

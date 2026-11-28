(defun jaccard (a b)
  (let ((u (union a b)) (i (intersection a b)))
    (if (null u) 1 (/ (length i) (length u)))))

(print (jaccard '(1 2 3 4) '(3 4 5)))

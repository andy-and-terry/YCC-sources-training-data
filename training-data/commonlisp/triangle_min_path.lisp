(defun minimum-total (triangle)
  (let ((dp (copy-list (car (last triangle)))))
    (dolist (row (cdr (reverse triangle)))
      (setf dp (loop for v in row
                     for (l r) on dp
                     collect (+ v (min l r)))))
    (first dp)))

(print (minimum-total '((2) (3 4) (6 5 7) (4 1 8 3)))) ; 11

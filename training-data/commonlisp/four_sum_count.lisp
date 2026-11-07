(defun four-sum-count (a b c d)
  (let ((sums (make-hash-table)) (count 0))
    (dolist (x a) (dolist (y b) (incf (gethash (+ x y) sums 0))))
    (dolist (x c) (dolist (y d) (incf count (gethash (- (+ x y)) sums 0))))
    count))

(print (four-sum-count '(1 2) '(-2 -1) '(-1 2) '(0 2))) ; 2

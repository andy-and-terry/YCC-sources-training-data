;; Bead (gravity) sort.
(defun bead-sort (nums)
  (let ((cols (loop for i from 1 to (reduce #'max nums) collect (count-if (lambda (n) (>= n i)) nums))))
    (reverse (loop for r from 1 to (length nums) collect (count-if (lambda (c) (>= c r)) cols)))))
(print (bead-sort '(5 3 1 4 2)))

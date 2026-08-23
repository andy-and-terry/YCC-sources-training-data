(defun sum-to (n &optional (acc 0))
  (if (> n 0) (sum-to (1- n) (+ acc n)) acc))

(print (sum-to 100))

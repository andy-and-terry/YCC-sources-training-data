(defun sum-of-squares (n)
  (loop for i from 1 to n sum (* i i)))

(print (sum-of-squares 5))
(print (sum-of-squares 10))
(print (reduce #'+ (mapcar (lambda (x) (* x x)) '(1 2 3 4))))
(terpri)

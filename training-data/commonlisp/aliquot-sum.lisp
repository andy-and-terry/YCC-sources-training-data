;; Aliquot sum classification.
(defun aliquot (n) (loop for d from 1 below n when (zerop (mod n d)) sum d))
(dolist (n '(6 12 15 28))
  (let ((a (aliquot n)))
    (format t "~a ~a ~a~%" n a (cond ((= a n) "perfect") ((> a n) "abundant") (t "deficient")))))

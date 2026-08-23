(defun power-of-two-p (n)
  (and (> n 0) (zerop (logand n (1- n)))))

(dolist (n '(1 2 3 4 16 18))
  (format t "~a: ~a~%" n (power-of-two-p n)))

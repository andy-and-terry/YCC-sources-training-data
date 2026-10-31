(defun digit-product (n)
  (loop for c across (write-to-string n)
        for p = (digit-char-p c) then (* p (digit-char-p c))
        finally (return p)))

(defun persistence (n)
  (loop for steps from 0
        while (>= n 10)
        do (setf n (digit-product n))
        finally (return steps)))

(dolist (n '(39 77 999 10))
  (format t "~a ~a~%" n (persistence n)))

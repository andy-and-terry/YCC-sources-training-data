(defun risky (n)
  (unwind-protect
       (progn
         (format t "working on ~a~%" n)
         (when (> n 2) (error "too big: ~a" n))
         (* n 10))
    (format t "cleanup for ~a~%" n)))

(print (risky 1))
(print (handler-case (risky 5)
         (error (e) (format nil "caught: ~a" e))))
(terpri)

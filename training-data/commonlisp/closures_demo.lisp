(defun make-counter ()
  (let ((count 0))
    (lambda () (incf count))))

(let ((counter (make-counter)))
  (print (funcall counter))
  (print (funcall counter))
  (print (funcall counter)))

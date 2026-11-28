(let ((h (make-hash-table :test 'equal)))
  (dolist (w '("a" "b" "a")) (incf (gethash w h 0)))
  (maphash (lambda (k v) (format t "~a=~a~%" k v)) h))

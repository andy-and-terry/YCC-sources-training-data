(let ((h (make-hash-table :test 'equal)))
  (setf (gethash "a" h) 1
        (gethash "b" h) 2)
  (maphash (lambda (k v) (format t "~a=~a~%" k v)) h)
  (print (hash-table-count h)))

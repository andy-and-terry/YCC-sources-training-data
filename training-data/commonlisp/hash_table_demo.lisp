(defparameter *ages* (make-hash-table :test 'equal))

(setf (gethash "Ada" *ages*) 36)
(setf (gethash "Bob" *ages*) 42)

(print (gethash "Ada" *ages*))
(print (gethash "Carol" *ages* :not-found))

(maphash (lambda (k v) (format t "~a: ~a~%" k v)) *ages*)

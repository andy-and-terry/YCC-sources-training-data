(defun call-count ()
  (let ((cell (load-time-value (list 0))))
    (incf (car cell))))

(call-count)
(call-count)
(format t "calls so far: ~a~%" (call-count))

(defun constant-table ()
  (load-time-value (make-array 3 :initial-contents '(a b c)) t))

(format t "~a~%" (constant-table))

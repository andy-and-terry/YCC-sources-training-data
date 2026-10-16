(defun make-counter (&optional (start 0) (step 1))
  (let ((n (- start step)))
    (lambda () (incf n step))))

(let ((a (make-counter))
      (b (make-counter 100 10)))
  (format t "~a ~a ~a~%" (funcall a) (funcall a) (funcall a))
  (format t "~a ~a~%" (funcall b) (funcall b))
  (format t "~a~%" (funcall a)))

(defun make-account (balance)
  (list (lambda (amt) (incf balance amt))
        (lambda () balance)))

(destructuring-bind (deposit peek) (make-account 50)
  (funcall deposit 25)
  (format t "balance ~a~%" (funcall peek)))

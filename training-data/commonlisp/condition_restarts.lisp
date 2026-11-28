(define-condition bad-input (error) ((v :initarg :v :reader v)))

(defun check (x)
  (restart-case (if (< x 0) (error 'bad-input :v x) x)
    (use-zero () 0)))

(print (handler-bind ((bad-input (lambda (c) (declare (ignore c)) (invoke-restart 'use-zero))))
         (check -5)))

(define-condition low-disk (warning)
  ((free :initarg :free :reader free)))

(defun check-disk (free)
  (when (< free 10)
    (warn 'low-disk :free free))
  (format t "check finished with ~a free~%" free))

(handler-bind ((low-disk (lambda (c)
                           (format t "logging: only ~a left~%" (free c))
                           (muffle-warning c))))
  (check-disk 50)
  (check-disk 4))

(format t "~a~%"
        (handler-case (error "boom ~a" 42)
          (simple-error (e) (format nil "caught: ~a" e))))

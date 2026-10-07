(defparameter *log*
  (make-array 0 :adjustable t :fill-pointer 0))

(defun log-append (item)
  (vector-push-extend item *log*))

(dolist (item '(:start :processing :done))
  (log-append item))

(format t "log: ~a~%" *log*)
(format t "count: ~a~%" (fill-pointer *log*))
(log-append :extra)
(format t "log after extra: ~a~%" *log*)

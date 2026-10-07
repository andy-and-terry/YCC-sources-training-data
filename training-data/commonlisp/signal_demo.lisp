(define-condition retry-suggested (condition)
  ((reason :initarg :reason :reader retry-reason)))

(defun risky-lookup (table key)
  (multiple-value-bind (value found) (gethash key table)
    (if found
        value
        (progn
          (signal 'retry-suggested :reason key)
          :default))))

;; SIGNAL raises a condition without unwinding the stack. With no handler
;; bound, control simply returns to RISKY-LOOKUP and the fallback value is
;; used; a bound handler can intervene, here just observing and logging.
(let ((table (make-hash-table)))
  (setf (gethash :a table) 1)
  (format t "unhandled: ~a~%" (risky-lookup table :b))
  (handler-bind
      ((retry-suggested
         (lambda (c) (format t "noticed missing key: ~a~%" (retry-reason c)))))
    (format t "handled: ~a~%" (risky-lookup table :c))))

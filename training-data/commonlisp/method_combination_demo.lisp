(defclass logger () ())

(defmethod process-value ((obj logger) value)
  (format t "processing ~a~%" value)
  (* value 2))

(defmethod process-value :before ((obj logger) value)
  (format t "before: about to process ~a~%" value))

(defmethod process-value :after ((obj logger) value)
  (format t "after: finished processing ~a~%" value))

(defmethod process-value :around ((obj logger) value)
  (format t "around: start~%")
  (let ((result (call-next-method)))
    (format t "around: end, result=~a~%" result)
    result))

(let ((l (make-instance 'logger)))
  (print (process-value l 5)))

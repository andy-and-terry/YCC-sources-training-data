(defgeneric process (obj))

(defmethod process :before ((obj integer))
  (format t "before: about to process ~a~%" obj))

(defmethod process ((obj integer))
  (format t "primary: processing ~a~%" obj)
  (* obj 2))

(defmethod process :after ((obj integer))
  (format t "after: done processing ~a~%" obj))

(defmethod process :around ((obj integer))
  (format t "around: entering~%")
  (let ((result (call-next-method)))
    (format t "around: leaving with result ~a~%" result)
    result))

(print (process 5))

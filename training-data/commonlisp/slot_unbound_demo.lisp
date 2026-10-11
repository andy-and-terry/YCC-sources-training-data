(defclass lazy-box ()
  ((value :accessor box-value)))

(defmethod slot-unbound (class (b lazy-box) (slot (eql 'value)))
  (declare (ignore class))
  (format t "computing value lazily~%")
  (setf (slot-value b 'value) (* 6 7)))

(let ((b (make-instance 'lazy-box)))
  (format t "bound? ~a~%" (slot-boundp b 'value))
  (format t "value ~a~%" (box-value b))
  (format t "bound? ~a~%" (slot-boundp b 'value))
  (slot-makunbound b 'value)
  (format t "bound? ~a~%" (slot-boundp b 'value)))

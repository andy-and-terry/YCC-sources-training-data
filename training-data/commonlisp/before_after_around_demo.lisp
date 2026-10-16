(defclass widget () ((name :initarg :name :reader name)))
(defclass button (widget) ())

(defgeneric render (w))
(defmethod render ((w widget)) (format t "[widget ~a]~%" (name w)))
(defmethod render :before ((w widget)) (format t "before widget~%"))
(defmethod render :before ((w button)) (format t "before button~%"))
(defmethod render :after ((w widget)) (format t "after widget~%"))
(defmethod render :around ((w button))
  (format t "around start~%")
  (call-next-method)
  (format t "around end~%"))

(render (make-instance 'button :name "ok"))

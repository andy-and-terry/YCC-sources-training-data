(defclass rectangle ()
  ((width :initarg :width :accessor rectangle-width)
   (height :initarg :height :accessor rectangle-height)
   (area :accessor rectangle-area)))

(defmethod initialize-instance :after ((r rectangle) &key)
  (setf (rectangle-area r) (* (rectangle-width r) (rectangle-height r))))

(defclass square (rectangle) ())

(defmethod initialize-instance :before ((s square) &key width height)
  (when (and width height (/= width height))
    (error "a square must have equal width and height")))

(let ((r (make-instance 'rectangle :width 3 :height 4)))
  (format t "rectangle area: ~a~%" (rectangle-area r)))

(let ((s (make-instance 'square :width 5 :height 5)))
  (format t "square area: ~a~%" (rectangle-area s)))

(handler-case
    (make-instance 'square :width 5 :height 6)
  (error (c) (format t "rejected: ~a~%" c)))

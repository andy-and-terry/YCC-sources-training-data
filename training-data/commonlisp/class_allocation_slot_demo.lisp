(defclass tracked ()
  ((count :allocation :class :initform 0 :accessor instance-count)
   (id :reader id)))

(defmethod initialize-instance :after ((x tracked) &key)
  (setf (slot-value x 'id) (incf (instance-count x))))

(let ((a (make-instance 'tracked))
      (b (make-instance 'tracked))
      (c (make-instance 'tracked)))
  (format t "ids ~a ~a ~a~%" (id a) (id b) (id c))
  (format t "shared count ~a~%" (instance-count a)))

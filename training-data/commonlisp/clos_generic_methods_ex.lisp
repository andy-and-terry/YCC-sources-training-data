(defclass animal () ((name :initarg :name :reader name)))
(defclass dog (animal) ())

(defgeneric speak (a))
(defmethod speak ((a animal)) (format nil "~a makes a sound" (name a)))
(defmethod speak ((a dog)) (format nil "~a barks; also: ~a" (name a) (call-next-method)))

(print (speak (make-instance 'dog :name "Rex")))

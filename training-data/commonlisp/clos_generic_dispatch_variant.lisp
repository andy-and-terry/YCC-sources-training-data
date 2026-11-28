(defclass animal () ((name :initarg :name :reader name)))
(defclass dog (animal) ())
(defgeneric speak (a))
(defmethod speak ((a animal)) (format nil "~a makes a noise" (name a)))
(defmethod speak ((a dog)) (format nil "~a barks" (name a)))

(print (speak (make-instance 'dog :name "Rex")))
(print (speak (make-instance 'animal :name "Thing")))

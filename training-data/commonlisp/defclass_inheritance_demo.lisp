(defclass animal ()
  ((name :initarg :name :accessor animal-name)))

(defmethod speak ((a animal))
  (format nil "~a makes a sound" (animal-name a)))

(defclass dog (animal) ())

(defmethod speak ((d dog))
  (format nil "~a says woof" (animal-name d)))

(print (speak (make-instance 'animal :name "Creature")))
(print (speak (make-instance 'dog :name "Rex")))

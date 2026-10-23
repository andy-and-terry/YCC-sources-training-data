;; change-class turns an existing instance into an instance of another class

(defclass person ()
  ((name :initarg :name :accessor name)))

(defclass employee (person)
  ((salary :initarg :salary :initform 0 :accessor salary)))

(defgeneric describe-it (obj))

(defmethod describe-it ((obj person))
  (format nil "person ~a" (name obj)))

(defmethod describe-it ((obj employee))
  (format nil "employee ~a earning ~a" (name obj) (salary obj)))

;; Called by change-class after the new slots are added
(defmethod update-instance-for-different-class :after
    ((old person) (new employee) &key)
  (format t "promoting ~a~%" (name new)))

(let ((p (make-instance 'person :name "Ada")))
  (format t "before: ~a~%" (describe-it p))
  (change-class p 'employee :salary 5000)
  (format t "after:  ~a~%" (describe-it p))
  (format t "same object is an employee? ~a~%" (typep p 'employee))
  (change-class p 'person)
  (format t "demoted: ~a~%" (describe-it p)))

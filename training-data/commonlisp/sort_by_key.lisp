(defstruct person name age)

(defparameter *people*
  (list (make-person :name "Ada" :age 30)
        (make-person :name "Bob" :age 25)
        (make-person :name "Cleo" :age 35)))

(dolist (p (sort (copy-list *people*) #'< :key #'person-age))
  (format t "~a: ~a~%" (person-name p) (person-age p)))

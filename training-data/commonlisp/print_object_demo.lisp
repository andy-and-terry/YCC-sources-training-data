(defclass point ()
  ((x :initarg :x :accessor point-x)
   (y :initarg :y :accessor point-y)))

(defmethod print-object ((p point) stream)
  (print-unreadable-object (p stream :type t)
    (format stream "~a, ~a" (point-x p) (point-y p))))

(defvar *origin* (make-instance 'point :x 0 :y 0))
(defvar *unit* (make-instance 'point :x 1 :y 1))

(print *origin*)
(print *unit*)
(format t "list of points: ~a~%" (list *origin* *unit*))

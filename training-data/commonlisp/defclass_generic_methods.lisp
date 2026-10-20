(defclass shape () ((name :initarg :name :reader shape-name)))
(defclass circle (shape) ((r :initarg :r :accessor radius)))
(defclass rect (shape) ((w :initarg :w :reader width) (h :initarg :h :reader height)))

(defgeneric area (s))
(defmethod area ((c circle)) (* pi (radius c) (radius c)))
(defmethod area ((r rect)) (* (width r) (height r)))
(defgeneric describe-shape (s))
(defmethod describe-shape ((s shape)) (format nil "~a" (shape-name s)))
(defmethod describe-shape :after ((s circle)) (format t "(after circle)~%"))

(dolist (s (list (make-instance 'circle :name "c" :r 1) (make-instance 'rect :name "r" :w 2 :h 3)))
  (format t "~a ~,2f~%" (describe-shape s) (area s)))

(defclass swimmer ()
  ((swim-speed :initarg :swim-speed :accessor swim-speed :initform 1)))

(defclass flyer ()
  ((fly-speed :initarg :fly-speed :accessor fly-speed :initform 1)))

(defmethod move ((s swimmer))
  (format nil "swims at speed ~a" (swim-speed s)))

(defmethod move ((f flyer))
  (format nil "flies at speed ~a" (fly-speed f)))

(defclass duck (swimmer flyer)
  ((name :initarg :name :accessor duck-name)))

;; DUCK inherits slots and methods from both SWIMMER and FLYER. The class
;; precedence list puts SWIMMER before FLYER, so CALL-NEXT-METHOD from
;; DUCK's own MOVE method reaches SWIMMER's MOVE next.
(defmethod move ((d duck))
  (format nil "~a: ~a, and also flies at speed ~a"
          (duck-name d) (call-next-method) (fly-speed d)))

(let ((d (make-instance 'duck :name "Donald" :swim-speed 3 :fly-speed 5)))
  (print (move d))
  (print (swim-speed d))
  (print (fly-speed d)))

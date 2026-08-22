(defclass stack ()
  ((items :initform nil :accessor stack-items)))

(defmethod push-item ((s stack) item)
  (push item (stack-items s)))

(defmethod pop-item ((s stack))
  (pop (stack-items s)))

(defmethod peek-item ((s stack))
  (first (stack-items s)))

(defmethod stack-empty-p ((s stack))
  (null (stack-items s)))

(let ((s (make-instance 'stack)))
  (push-item s 1)
  (push-item s 2)
  (push-item s 3)
  (format t "~a ~a ~a~%" (pop-item s) (peek-item s) (stack-empty-p s)))

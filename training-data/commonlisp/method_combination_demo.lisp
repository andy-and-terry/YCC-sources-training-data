(defclass account ()
  ((balance :initarg :balance :accessor balance :initform 0)))

(defgeneric withdraw (account amount))

(defmethod withdraw :before ((a account) amount)
  (format t "checking: withdrawing ~a from balance ~a~%" amount (balance a)))

(defmethod withdraw ((a account) amount)
  (decf (balance a) amount))

(defmethod withdraw :after ((a account) amount)
  (declare (ignore amount))
  (format t "new balance: ~a~%" (balance a)))

(defmethod withdraw :around ((a account) amount)
  (if (> amount (balance a))
      (format t "denied: insufficient funds~%")
      (call-next-method)))

(let ((acc (make-instance 'account :balance 100)))
  (withdraw acc 30)
  (withdraw acc 1000))

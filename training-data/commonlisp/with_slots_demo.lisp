(defclass account ()
  ((balance :initarg :balance :initform 0)
   (owner :initarg :owner)))

(defmethod deposit ((a account) amount)
  (with-slots (balance) a
    (incf balance amount)))

(defmethod describe-account ((a account))
  (with-slots (balance owner) a
    (format nil "~a's balance: ~a" owner balance)))

(let ((acc (make-instance 'account :owner "Ada" :balance 100)))
  (deposit acc 50)
  (print (describe-account acc)))

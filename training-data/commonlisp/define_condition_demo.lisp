(define-condition insufficient-funds (error)
  ((balance :initarg :balance :reader ifc-balance)
   (amount :initarg :amount :reader ifc-amount))
  (:report (lambda (condition stream)
             (format stream "cannot withdraw ~a: balance is only ~a"
                     (ifc-amount condition) (ifc-balance condition)))))

(defun withdraw (balance amount)
  (if (> amount balance)
      (error 'insufficient-funds :balance balance :amount amount)
      (- balance amount)))

(format t "result: ~a~%" (withdraw 100 30))

(handler-case
    (withdraw 100 500)
  (insufficient-funds (c)
    (format t "handled: ~a (short by ~a)~%"
            c (- (ifc-amount c) (ifc-balance c)))))

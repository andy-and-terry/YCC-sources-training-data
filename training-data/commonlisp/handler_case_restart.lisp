(define-condition bad-input (error) ((v :initarg :v :reader v)))
(defun check (x) (if (< x 0) (error 'bad-input :v x) x))
(print (handler-case (check -5) (bad-input (e) (list :bad (v e)))))
(print (handler-case (check 5) (bad-input () :bad)))

(defun safe-div (a b)
  (handler-case (/ a b)
    (division-by-zero () :infinity)))

(print (safe-div 10 2))
(print (safe-div 1 0))

(define-condition my-error (error) ((msg :initarg :msg :reader msg)))
(print (handler-case (error 'my-error :msg "boom")
         (my-error (e) (msg e))))

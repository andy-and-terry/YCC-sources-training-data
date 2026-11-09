(defmacro my-unless (test &body body)
  `(if ,test nil (progn ,@body)))
(print (my-unless nil 1 2 3))
(print (macroexpand-1 '(my-unless x (foo))))

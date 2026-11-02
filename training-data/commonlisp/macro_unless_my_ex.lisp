(defmacro my-unless (cond &body body)
  `(if ,cond nil (progn ,@body)))
(my-unless (> 1 2) (print "ran"))

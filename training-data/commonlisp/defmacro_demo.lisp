(defmacro my-unless (condition &body body)
  `(if (not ,condition)
       (progn ,@body)))

(defmacro with-timing-noop (&body body)
  `(progn ,@body))

(my-unless (> 1 2)
  (print "1 is not greater than 2"))

(with-timing-noop
  (print (+ 1 2 3)))

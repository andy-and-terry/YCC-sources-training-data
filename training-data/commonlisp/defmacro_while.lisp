(defmacro while-do (test &body body)
  `(loop (unless ,test (return)) ,@body))

(let ((i 0))
  (while-do (< i 3)
    (format t "~a " i)
    (incf i)))
(terpri)

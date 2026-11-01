(defmacro while (test &body body)
  `(loop (unless ,test (return)) ,@body))

(defmacro swap (a b)
  (let ((tmp (gensym)))
    `(let ((,tmp ,a)) (setf ,a ,b ,b ,tmp))))

(let ((i 0) (x 1) (y 2))
  (while (< i 3) (incf i))
  (swap x y)
  (print (list i x y)))

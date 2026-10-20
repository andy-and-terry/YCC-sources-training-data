(defmacro swap (a b) (let ((tmp (gensym))) `(let ((,tmp ,a)) (setf ,a ,b ,b ,tmp))))
(let ((x 1) (y 2)) (swap x y) (print (list x y)))

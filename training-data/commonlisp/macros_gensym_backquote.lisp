(defmacro swap (a b)
  (let ((tmp (gensym)))
    `(let ((,tmp ,a)) (setf ,a ,b ,b ,tmp))))

(defmacro while (test &body body) `(loop (unless ,test (return)) ,@body))
(defmacro my-when (c &rest body) `(if ,c (progn ,@body)))
(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(mapcar (lambda (n) `(,n (gensym))) names) ,@body))

(let ((x 1) (y 2)) (swap x y) (format t "~a ~a~%" x y))
(let ((i 0)) (while (< i 3) (format t "~a " i) (incf i)) (terpri))
(my-when t (format t "when~%"))
(format t "~s~%" (macroexpand-1 '(swap p q)))

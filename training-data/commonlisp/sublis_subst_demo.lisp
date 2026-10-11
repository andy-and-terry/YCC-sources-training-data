(defparameter *expr* '(+ (* x 2) (- y x)))

(format t "~a~%" (subst 10 'x *expr*))
(format t "~a~%" (sublis '((x . 3) (y . 4)) *expr*))
(format t "~a~%" (subst-if 0 #'numberp '(1 (2 a) 3 b)))

(defun evaluate (form env)
  (eval (sublis env form)))

(format t "~a~%" (evaluate *expr* '((x . 3) (y . 4))))

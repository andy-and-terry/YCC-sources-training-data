(defun compose (&rest fns)
  (reduce (lambda (f g) (lambda (&rest args) (funcall f (apply g args))))
          fns :initial-value #'identity))

(defun pipe (&rest fns)
  (apply #'compose (reverse fns)))

(let ((inc-then-double (pipe #'1+ (lambda (x) (* 2 x)))))
  (print (funcall inc-then-double 5)))

(print (funcall (compose #'sqrt #'abs) -16))
(print (funcall (pipe #'string-upcase #'reverse) "lisp"))
(terpri)

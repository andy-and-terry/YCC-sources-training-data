(defun evaluate-expression-string (str)
  (eval (read-from-string str)))

(format t "(+ 1 2 3) -> ~a~%" (evaluate-expression-string "(+ 1 2 3)"))
(format t "(* 6 7) -> ~a~%" (evaluate-expression-string "(* 6 7)"))

(defparameter *registered-ops*
  (list (cons "double" (lambda (x) (* 2 x)))
        (cons "square" (lambda (x) (* x x)))))

(defun run-op (name arg)
  (let ((op (cdr (assoc name *registered-ops* :test #'string=))))
    (if op
        (funcall op arg)
        (error "unknown op: ~a" name))))

(format t "double 21 -> ~a~%" (run-op "double" 21))
(format t "square 9 -> ~a~%" (run-op "square" 9))

;; Building and evaluating a form programmatically rather than from a string.
(let ((form (list '+ 10 (list '* 2 3))))
  (format t "built form ~a evaluates to ~a~%" form (eval form)))

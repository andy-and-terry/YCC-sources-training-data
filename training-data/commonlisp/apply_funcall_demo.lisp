;; Calling functions indirectly: funcall, apply, function objects.
(print (funcall #'+ 1 2 3))
(print (apply #'+ '(1 2 3)))
(print (apply #'+ 1 2 '(3 4 5)))
(print (apply #'max '(3 9 2)))
(print (funcall (lambda (x y) (* x y)) 6 7))

;; functions by name
(print (funcall 'reverse '(1 2 3)))
(print (funcall (symbol-function 'length) "four"))
(print (fboundp 'car))
(print (functionp #'car))
(print (functionp 'car))

;; dispatch table of operations
(defparameter *ops*
  (list (cons "add" #'+)
        (cons "sub" #'-)
        (cons "mul" #'*)))

(defun calc (op a b)
  (let ((fn (cdr (assoc op *ops* :test #'string=))))
    (if fn (funcall fn a b) (error "unknown op ~a" op))))

(print (calc "mul" 6 7))
(print (mapcar (lambda (op) (calc op 10 4)) '("add" "sub" "mul")))

;; function returning functions
(defun make-adder (n) (lambda (x) (+ x n)))
(print (funcall (make-adder 10) 5))
(print (mapcar (make-adder 100) '(1 2 3)))
(print (apply #'mapcar #'list '((1 2 3) (a b c))))

(defun make-counter ()
  (let ((n 0)) (lambda () (incf n))))
(let ((c (make-counter))) (funcall c) (funcall c) (print (funcall c)))
(print (labels ((fib (n) (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2)))))) (fib 15)))

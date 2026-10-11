(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun make-name (prefix n)
    (intern (format nil "~a-~d" prefix n))))

(defmacro define-constants (prefix &rest values)
  `(progn
     ,@(loop for v in values
             for i from 1
             collect `(defparameter ,(make-name prefix i) ,v))))

(define-constants level 10 20 30)
(format t "~a ~a ~a~%" level-1 level-2 level-3)

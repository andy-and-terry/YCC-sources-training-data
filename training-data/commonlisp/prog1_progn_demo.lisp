(defvar *stack* (list 1 2 3))

(defun pop-and-log ()
  (prog1 (pop *stack*)
    (format t "stack now ~a~%" *stack*)))

(format t "popped ~a~%" (pop-and-log))
(format t "popped ~a~%" (pop-and-log))

(let ((x (prog2 (format t "setup~%") 'result (format t "cleanup~%"))))
  (format t "x = ~a~%" x))

(format t "~a~%" (progn 1 2 3))

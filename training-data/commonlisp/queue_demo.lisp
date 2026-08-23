(defvar *queue* nil)

(defun enqueue (value)
  (setf *queue* (append *queue* (list value))))

(defun dequeue ()
  (let ((value (car *queue*)))
    (setf *queue* (cdr *queue*))
    value))

(enqueue 1)
(enqueue 2)
(enqueue 3)
(print (dequeue))
(print (dequeue))

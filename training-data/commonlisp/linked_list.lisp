(defstruct list-node value next)

(defun list-push-front (head value)
  (make-list-node :value value :next head))

(defun list-to-vector (head)
  (let ((result nil))
    (loop for node = head then (list-node-next node)
          while node
          do (push (list-node-value node) result))
    (nreverse result)))

(defun list-reverse (head)
  (let ((prev nil) (current head))
    (loop while current do
      (let ((next (list-node-next current)))
        (setf (list-node-next current) prev)
        (setf prev current)
        (setf current next)))
    prev))

(let ((head nil))
  (dolist (v '(3 2 1))
    (setf head (list-push-front head v)))
  (print (list-to-vector head))
  (print (list-to-vector (list-reverse head))))

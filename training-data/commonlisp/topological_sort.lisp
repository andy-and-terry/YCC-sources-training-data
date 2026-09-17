(defparameter *adj*
  '((0 . (1 2))
    (1 . (3))
    (2 . (3))
    (3 . (4))
    (4 . ())))

(defun visit (node visited order)
  (unless (gethash node visited)
    (setf (gethash node visited) t)
    (dolist (n (cdr (assoc node *adj*)))
      (visit n visited order))
    (push node (car order))))

(defun topological-sort (nodes)
  (let ((visited (make-hash-table))
        (order (list nil)))
    (dolist (n nodes)
      (visit n visited order))
    (car order)))

(print (topological-sort '(0 1 2 3 4)))

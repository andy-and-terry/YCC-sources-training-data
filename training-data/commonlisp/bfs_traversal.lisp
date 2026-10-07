(defparameter *adj*
  '((0 . (1 2))
    (1 . (0 3))
    (2 . (0 3))
    (3 . (1 2 4))
    (4 . (3))))

(defun neighbors (node)
  (cdr (assoc node *adj*)))

(defun bfs (start)
  (let ((visited (make-hash-table))
        (queue (list start))
        (order nil))
    (setf (gethash start visited) t)
    (loop while queue do
      (let ((node (pop queue)))
        (push node order)
        (dolist (n (neighbors node))
          (unless (gethash n visited)
            (setf (gethash n visited) t)
            (setf queue (append queue (list n)))))))
    (nreverse order)))

(print (bfs 0))

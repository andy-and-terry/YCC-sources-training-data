(defparameter *graph*
  '((a . (b c))
    (b . (d))
    (c . (d))
    (d . ())))

(defun bfs (start)
  (let ((visited (list start))
        (queue (list start))
        (order nil))
    (loop while queue do
      (let ((node (pop queue)))
        (push node order)
        (dolist (neighbor (cdr (assoc node *graph*)))
          (unless (member neighbor visited)
            (push neighbor visited)
            (setf queue (append queue (list neighbor)))))))
    (nreverse order)))

(print (bfs 'a))

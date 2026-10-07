(defparameter *graph*
  '((a . (b c))
    (b . (d))
    (c . (d))
    (d . ())))

(defun dfs (node visited)
  (if (member node visited)
      visited
      (let ((visited (cons node visited)))
        (dolist (neighbor (cdr (assoc node *graph*)))
          (setf visited (dfs neighbor visited)))
        visited)))

(print (nreverse (dfs 'a nil)))

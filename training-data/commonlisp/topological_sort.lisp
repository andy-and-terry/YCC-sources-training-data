(defparameter *graph*
  '((:a :c) (:b :c :d) (:c :e) (:d :f) (:e :f) (:f)))

(defun topo-sort (graph)
  (let ((visited (make-hash-table))
        (result nil))
    (labels ((visit (node)
               (unless (gethash node visited)
                 (setf (gethash node visited) t)
                 (dolist (neighbor (cdr (assoc node graph)))
                   (visit neighbor))
                 (push node result))))
      (dolist (entry graph)
        (visit (car entry))))
    result))

(print (topo-sort *graph*))

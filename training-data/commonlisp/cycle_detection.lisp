;; Detects a cycle in a directed graph via DFS three-coloring: reaching a
;; :gray node (still on the current path) means a back edge, i.e. a cycle.
(defun has-cycle-p (graph nodes)
  (let ((color (make-hash-table)))
    (dolist (n nodes) (setf (gethash n color) :white))
    (labels ((visit (node)
               (setf (gethash node color) :gray)
               (let ((result
                       (some (lambda (neighbor)
                               (case (gethash neighbor color)
                                 (:gray t)
                                 (:white (visit neighbor))
                                 (t nil)))
                             (gethash node graph))))
                 (setf (gethash node color) :black)
                 result)))
      (some (lambda (n) (when (eq (gethash n color) :white) (visit n))) nodes))))

(defparameter *cyclic-graph*
  (let ((h (make-hash-table)))
    (setf (gethash 0 h) '(1))
    (setf (gethash 1 h) '(2))
    (setf (gethash 2 h) '(3))
    (setf (gethash 3 h) '(1))
    h))

(defparameter *acyclic-graph*
  (let ((h (make-hash-table)))
    (setf (gethash 0 h) '(1))
    (setf (gethash 1 h) '(2))
    (setf (gethash 2 h) '(3))
    (setf (gethash 3 h) '())
    h))

(print (has-cycle-p *cyclic-graph* '(0 1 2 3)))
(print (has-cycle-p *acyclic-graph* '(0 1 2 3)))

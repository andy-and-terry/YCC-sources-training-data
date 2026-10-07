(defparameter *parent* (make-hash-table))

(defun find-root (x)
  (if (eql (gethash x *parent*) x)
      x
      (setf (gethash x *parent*) (find-root (gethash x *parent*)))))

(defun union-sets (a b)
  (setf (gethash (find-root a) *parent*) (find-root b)))

(defun kruskal (nodes edges)
  (dolist (n nodes) (setf (gethash n *parent*) n))
  (let ((sorted (sort (copy-list edges) #'< :key #'third))
        (total 0))
    (dolist (edge sorted)
      (destructuring-bind (u v w) edge
        (unless (eql (find-root u) (find-root v))
          (union-sets u v)
          (incf total w)
          (format t "~a - ~a : ~a~%" u v w))))
    (format t "total: ~a~%" total)))

(kruskal '(a b c d e)
         '((a b 1) (b c 2) (a c 3) (c d 4) (d e 5)))

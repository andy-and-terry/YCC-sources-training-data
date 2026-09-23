(defparameter *mst-parent* (make-array 5))

(defun mst-find (x)
  (if (= (aref *mst-parent* x) x)
      x
      (setf (aref *mst-parent* x) (mst-find (aref *mst-parent* x)))))

(defun mst-union (a b)
  (let ((ra (mst-find a)) (rb (mst-find b)))
    (if (= ra rb)
        nil
        (progn (setf (aref *mst-parent* rb) ra) t))))

;; edges are (weight u v) lists; sorting by weight and greedily union-ing
;; endpoints (skipping any edge that would close a cycle) builds the MST.
(defun kruskal (num-nodes edges)
  (dotimes (i num-nodes) (setf (aref *mst-parent* i) i))
  (let ((sorted (sort (copy-list edges) #'< :key #'first))
        (total 0)
        (used 0))
    (dolist (edge sorted)
      (when (and (< used (1- num-nodes)) (mst-union (second edge) (third edge)))
        (incf total (first edge))
        (incf used)))
    total))

(print (kruskal 5 '((2 0 1) (3 1 2) (1 0 3) (4 2 3) (5 3 4) (2 1 4))))

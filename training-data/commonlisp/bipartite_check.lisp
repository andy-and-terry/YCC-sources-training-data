(defun bipartite-p (adjacency num-nodes)
  (let ((colors (make-array num-nodes :initial-element nil)))
    (labels ((bfs (start)
               (setf (aref colors start) 0)
               (let ((queue (list start)))
                 (loop while queue do
                   (let* ((node (pop queue))
                          (node-color (aref colors node)))
                     (dolist (neighbor (funcall adjacency node))
                       (cond
                         ((null (aref colors neighbor))
                          (setf (aref colors neighbor) (- 1 node-color))
                          (setf queue (append queue (list neighbor))))
                         ((= (aref colors neighbor) node-color)
                          (return-from bipartite-p nil)))))))))
      (dotimes (n num-nodes)
        (when (null (aref colors n))
          (bfs n)))
      t)))

(defun make-adjacency (edges num-nodes)
  (let ((adj (make-array num-nodes :initial-element nil)))
    (dolist (edge edges)
      (push (second edge) (aref adj (first edge)))
      (push (first edge) (aref adj (second edge))))
    (lambda (node) (aref adj node))))

;; Even cycle 0-1-2-3-0: bipartite.
(let ((adj (make-adjacency '((0 1) (1 2) (2 3) (3 0)) 4)))
  (format t "even cycle bipartite: ~a~%" (bipartite-p adj 4)))

;; Odd cycle 0-1-2-0: not bipartite.
(let ((adj (make-adjacency '((0 1) (1 2) (2 0)) 3)))
  (format t "odd cycle bipartite: ~a~%" (bipartite-p adj 3)))

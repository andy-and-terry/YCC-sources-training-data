(defstruct tree-node value left right)

(defun tree-insert (node value)
  (cond
    ((null node) (make-tree-node :value value))
    ((< value (tree-node-value node))
     (setf (tree-node-left node) (tree-insert (tree-node-left node) value))
     node)
    (t
     (setf (tree-node-right node) (tree-insert (tree-node-right node) value))
     node)))

(defun inorder (node)
  (when node
    (append (inorder (tree-node-left node))
            (list (tree-node-value node))
            (inorder (tree-node-right node)))))

(let ((root nil))
  (dolist (v '(5 3 8 1 4 7 9))
    (setf root (tree-insert root v)))
  (print (inorder root)))

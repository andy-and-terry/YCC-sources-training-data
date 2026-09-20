(defstruct trie-node (children (make-hash-table)) (is-end nil))

(defun trie-insert (root word)
  (let ((node root))
    (loop for ch across word do
      (let ((child (gethash ch (trie-node-children node))))
        (unless child
          (setf child (make-trie-node))
          (setf (gethash ch (trie-node-children node)) child))
        (setf node child)))
    (setf (trie-node-is-end node) t)))

(defun trie-search (root word)
  (let ((node root))
    (loop for ch across word do
      (setf node (gethash ch (trie-node-children node)))
      (unless node (return-from trie-search nil)))
    (and node (trie-node-is-end node))))

(defparameter *root* (make-trie-node))
(dolist (w '("cat" "car" "cart" "dog"))
  (trie-insert *root* w))

(print (trie-search *root* "car"))
(print (trie-search *root* "ca"))
(print (trie-search *root* "cart"))
(print (trie-search *root* "bird"))

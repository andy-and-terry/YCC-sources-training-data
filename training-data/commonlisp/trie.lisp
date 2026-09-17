(defstruct trie-node
  (children (make-hash-table))
  (is-word nil))

(defun trie-insert (root word)
  (let ((node root))
    (loop for ch across word do
      (let ((child (gethash ch (trie-node-children node))))
        (unless child
          (setf child (make-trie-node))
          (setf (gethash ch (trie-node-children node)) child))
        (setf node child)))
    (setf (trie-node-is-word node) t)))

(defun trie-search (root word)
  (let ((node root))
    (loop for ch across word do
      (setf node (gethash ch (trie-node-children node)))
      (unless node (return-from trie-search nil)))
    (trie-node-is-word node)))

(defun trie-starts-with (root prefix)
  (let ((node root))
    (loop for ch across prefix do
      (setf node (gethash ch (trie-node-children node)))
      (unless node (return-from trie-starts-with nil)))
    t))

(let ((root (make-trie-node)))
  (trie-insert root "cat")
  (trie-insert root "car")
  (trie-insert root "dog")
  (print (trie-search root "cat"))
  (print (trie-search root "ca"))
  (print (trie-starts-with root "ca")))

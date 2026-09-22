(defstruct trie-node
  (children (make-hash-table))
  (end? nil))

(defun trie-insert (root word)
  (let ((node root))
    (loop for ch across word do
      (let ((child (gethash ch (trie-node-children node))))
        (unless child
          (setf child (make-trie-node))
          (setf (gethash ch (trie-node-children node)) child))
        (setf node child)))
    (setf (trie-node-end? node) t)))

(defun trie-find-node (root word)
  (let ((node root))
    (loop for ch across word do
      (setf node (gethash ch (trie-node-children node)))
      (unless node (return-from trie-find-node nil)))
    node))

(defun trie-contains (root word)
  (let ((node (trie-find-node root word)))
    (and node (trie-node-end? node))))

(defun trie-starts-with (root prefix)
  (not (null (trie-find-node root prefix))))

(let ((root (make-trie-node)))
  (dolist (w '("cat" "car" "cart" "dog"))
    (trie-insert root w))
  (format t "~a~%" (trie-contains root "car"))
  (format t "~a~%" (trie-contains root "ca"))
  (format t "~a~%" (trie-starts-with root "ca"))
  (format t "~a~%" (trie-starts-with root "do"))
  (format t "~a~%" (trie-starts-with root "z")))

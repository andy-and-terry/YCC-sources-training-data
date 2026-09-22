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

(defun trie-find-node (root word)
  (let ((node root))
    (loop for ch across word do
      (setf node (gethash ch (trie-node-children node)))
      (unless node (return-from trie-find-node nil)))
    node))

(defun trie-search (root word)
  (let ((node (trie-find-node root word)))
    (and node (trie-node-is-word node))))

(defun trie-starts-with (root prefix)
  (not (null (trie-find-node root prefix))))

(let ((root (make-trie-node)))
  (dolist (w '("cat" "car" "card" "care" "dog"))
    (trie-insert root w))
  (format t "search 'car': ~a~%" (trie-search root "car"))
  (format t "search 'ca': ~a~%" (trie-search root "ca"))
  (format t "starts-with 'ca': ~a~%" (trie-starts-with root "ca"))
  (format t "starts-with 'do': ~a~%" (trie-starts-with root "do"))
  (format t "starts-with 'bird': ~a~%" (trie-starts-with root "bird")))

(defstruct avl-node val left right (height 1))

(defun node-height (node)
  (if node (avl-node-height node) 0))

(defun update-height! (node)
  (setf (avl-node-height node)
        (1+ (max (node-height (avl-node-left node)) (node-height (avl-node-right node))))))

(defun balance-factor (node)
  (if node
      (- (node-height (avl-node-left node)) (node-height (avl-node-right node)))
      0))

(defun rotate-right (node)
  (let ((l (avl-node-left node)))
    (setf (avl-node-left node) (avl-node-right l))
    (setf (avl-node-right l) node)
    (update-height! node)
    (update-height! l)
    l))

(defun rotate-left (node)
  (let ((r (avl-node-right node)))
    (setf (avl-node-right node) (avl-node-left r))
    (setf (avl-node-left r) node)
    (update-height! node)
    (update-height! r)
    r))

(defun avl-insert (node val)
  (if (null node)
      (make-avl-node :val val)
      (progn
        (cond
          ((< val (avl-node-val node))
           (setf (avl-node-left node) (avl-insert (avl-node-left node) val)))
          ((> val (avl-node-val node))
           (setf (avl-node-right node) (avl-insert (avl-node-right node) val))))
        (update-height! node)
        (let ((bf (balance-factor node)))
          (cond
            ((and (> bf 1) (< val (avl-node-val (avl-node-left node))))
             (rotate-right node))
            ((and (> bf 1) (> val (avl-node-val (avl-node-left node))))
             (setf (avl-node-left node) (rotate-left (avl-node-left node)))
             (rotate-right node))
            ((and (< bf -1) (> val (avl-node-val (avl-node-right node))))
             (rotate-left node))
            ((and (< bf -1) (< val (avl-node-val (avl-node-right node))))
             (setf (avl-node-right node) (rotate-right (avl-node-right node)))
             (rotate-left node))
            (t node))))))

(defun avl-inorder (node)
  (if (null node)
      nil
      (append (avl-inorder (avl-node-left node))
              (list (avl-node-val node))
              (avl-inorder (avl-node-right node)))))

(let ((tree nil))
  (dolist (v '(10 20 30 40 50 25))
    (setf tree (avl-insert tree v)))
  (format t "inorder: ~a~%" (avl-inorder tree))
  (format t "root: ~a, height: ~a~%" (avl-node-val tree) (avl-node-height tree)))

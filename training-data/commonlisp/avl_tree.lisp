(defstruct avl-node value left right (height 1))

(defun node-height (node)
  (if node (avl-node-height node) 0))

(defun update-height (node)
  (setf (avl-node-height node)
        (1+ (max (node-height (avl-node-left node))
                  (node-height (avl-node-right node))))))

(defun balance-factor (node)
  (if node
      (- (node-height (avl-node-left node)) (node-height (avl-node-right node)))
      0))

(defun rotate-right (y)
  (let ((x (avl-node-left y)))
    (setf (avl-node-left y) (avl-node-right x))
    (setf (avl-node-right x) y)
    (update-height y)
    (update-height x)
    x))

(defun rotate-left (x)
  (let ((y (avl-node-right x)))
    (setf (avl-node-right x) (avl-node-left y))
    (setf (avl-node-left y) x)
    (update-height x)
    (update-height y)
    y))

(defun avl-insert (node value)
  (if (null node)
      (make-avl-node :value value)
      (progn
        (cond
          ((< value (avl-node-value node))
           (setf (avl-node-left node) (avl-insert (avl-node-left node) value)))
          ((> value (avl-node-value node))
           (setf (avl-node-right node) (avl-insert (avl-node-right node) value)))
          (t (return-from avl-insert node)))
        (update-height node)
        (let ((balance (balance-factor node)))
          (cond
            ((and (> balance 1) (< value (avl-node-value (avl-node-left node))))
             (rotate-right node))
            ((and (< balance -1) (> value (avl-node-value (avl-node-right node))))
             (rotate-left node))
            ((and (> balance 1) (> value (avl-node-value (avl-node-left node))))
             (setf (avl-node-left node) (rotate-left (avl-node-left node)))
             (rotate-right node))
            ((and (< balance -1) (< value (avl-node-value (avl-node-right node))))
             (setf (avl-node-right node) (rotate-right (avl-node-right node)))
             (rotate-left node))
            (t node))))))

(defun inorder (node)
  (when node
    (append (inorder (avl-node-left node))
            (list (avl-node-value node))
            (inorder (avl-node-right node)))))

(let ((root nil))
  (dolist (v '(10 20 30 40 50 25))
    (setf root (avl-insert root v)))
  (format t "inorder: ~a~%" (inorder root))
  (format t "root value: ~a, height: ~a~%"
          (avl-node-value root) (avl-node-height root)))

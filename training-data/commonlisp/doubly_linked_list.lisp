(defstruct dnode value prev next)

(defstruct dlist head tail)

(defun dlist-push-back (lst value)
  (let ((node (make-dnode :value value)))
    (if (null (dlist-tail lst))
        (progn
          (setf (dlist-head lst) node)
          (setf (dlist-tail lst) node))
        (progn
          (setf (dnode-prev node) (dlist-tail lst))
          (setf (dnode-next (dlist-tail lst)) node)
          (setf (dlist-tail lst) node)))
    lst))

(defun dlist-remove (lst node)
  (let ((p (dnode-prev node)) (n (dnode-next node)))
    (if p (setf (dnode-next p) n) (setf (dlist-head lst) n))
    (if n (setf (dnode-prev n) p) (setf (dlist-tail lst) p))))

(defun dlist-to-list (lst)
  (loop for node = (dlist-head lst) then (dnode-next node)
        while node
        collect (dnode-value node)))

(let ((lst (make-dlist)))
  (dlist-push-back lst 1)
  (dlist-push-back lst 2)
  (dlist-push-back lst 3)
  (print (dlist-to-list lst))
  (dlist-remove lst (dnode-next (dlist-head lst)))
  (print (dlist-to-list lst)))

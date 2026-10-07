(defun flatten (tree)
  (cond ((null tree) nil)
        ((atom tree) (list tree))
        (t (append (flatten (car tree))
                   (flatten (cdr tree))))))

(defun tree-depth (tree)
  (if (atom tree)
      0
      (1+ (reduce #'max (mapcar #'tree-depth tree) :initial-value 0))))

(let ((tree '(1 (2 (3 4)) ((5)) 6)))
  (format t "flattened: ~a~%" (flatten tree))
  (format t "depth: ~a~%" (tree-depth tree))
  (format t "subst: ~a~%" (subst 'x 3 tree))
  (format t "tree-equal: ~a~%" (tree-equal tree (copy-tree tree))))

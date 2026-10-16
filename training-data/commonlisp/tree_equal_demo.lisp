(format t "~a~%" (tree-equal '(1 (2 3) 4) '(1 (2 3) 4)))
(format t "~a~%" (tree-equal '(1 (2 3)) '(1 (2 4))))
(format t "~a~%" (tree-equal '("a" ("b")) '("a" ("b")) :test #'string=))
(format t "~a~%" (copy-tree '((1 2) (3 (4)))))
(format t "~a~%" (subst 'z 'b '(a (b c) b)))

(defun count-atoms (tree)
  (cond ((null tree) 0)
        ((atom tree) 1)
        (t (+ (count-atoms (car tree)) (count-atoms (cdr tree))))))

(format t "~a~%" (count-atoms '(a (b (c d)) e)))

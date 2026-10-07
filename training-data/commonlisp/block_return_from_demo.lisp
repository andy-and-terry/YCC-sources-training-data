(defun find-first-negative (list)
  (dolist (x list nil)
    (when (minusp x)
      (return x))))                 ; dolist establishes a NIL block

(defun nested-search (matrix target)
  (block search
    (loop for row in matrix
          for r from 0
          do (loop for v in row
                   for c from 0
                   do (when (eql v target)
                        (return-from search (list r c)))))
    :not-found))

(print (find-first-negative '(3 5 -2 7)))
(print (nested-search '((1 2 3) (4 5 6)) 5))
(print (nested-search '((1 2 3) (4 5 6)) 99))
(terpri)

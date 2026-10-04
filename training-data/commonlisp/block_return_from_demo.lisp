(defun find-first-negative (list)
  (block search
    (dolist (x list)
      (when (minusp x)
        (return-from search x)))
    nil))

(print (find-first-negative '(3 5 -2 7 -9)))
(print (find-first-negative '(1 2 3)))

(defun nested-exit ()
  (block outer
    (dotimes (i 3)
      (dotimes (j 3)
        (when (= (* i j) 4) (return-from outer (list i j)))))
    :none))
(print (nested-exit))
(terpri)

(defun find-first-negative (numbers)
  (catch 'found
    (dolist (n numbers)
      (when (< n 0)
        (throw 'found n)))
    nil))

(defun search-nested (matrix target)
  (catch 'search-done
    (dolist (row matrix)
      (dolist (cell row)
        (when (= cell target)
          (throw 'search-done cell))))
    :not-found))

(print (find-first-negative '(3 7 -2 9)))
(print (find-first-negative '(1 2 3)))
(print (search-nested '((1 2) (3 4) (5 6)) 4))

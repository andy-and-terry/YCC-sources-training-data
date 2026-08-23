(defun second-largest (lst)
  (second (sort (remove-duplicates (copy-list lst)) #'>)))

(print (second-largest '(5 3 8 1 9 2)))

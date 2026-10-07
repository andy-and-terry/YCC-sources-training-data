(defparameter *people*
  (list '("alice" . 30) '("bob" . 25) '("carol" . 30) '("dave" . 25)))

;; stable-sort keeps equal elements in their original order
(print (stable-sort (copy-list *people*) #'< :key #'cdr))

(print (sort (list 5 2 8 1) #'>))
(print (sort (vector 3 1 2) #'<))
(print (sort (list "pear" "fig" "apple") #'string<))
(print (sort (list "pear" "fig" "apple") #'< :key #'length))

;; sort is destructive: always use its return value
(let ((xs (list 3 1 2)))
  (setf xs (sort xs #'<))
  (print xs))
(terpri)

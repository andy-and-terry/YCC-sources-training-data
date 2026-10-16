(format t "~a~%" (merge 'list (list 1 4 9) (list 2 3 10) #'<))
(format t "~a~%" (merge 'vector (vector "a" "c") (vector "b" "d") #'string<))

(defun merge-sort-lists (a b)
  (merge 'list (copy-list a) (copy-list b) #'<))

(format t "~a~%" (merge-sort-lists '(5 6) '(1 7)))

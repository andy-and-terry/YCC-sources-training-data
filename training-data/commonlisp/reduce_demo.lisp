(print (reduce #'+ '(1 2 3 4 5)))
(print (reduce #'max '(3 9 2 7)))
(print (reduce #'+ '() :initial-value 0))
(print (reduce #'list '(1 2 3 4)))                    ; left fold
(print (reduce #'list '(1 2 3 4) :from-end t))        ; right fold
(print (reduce (lambda (acc x) (+ (* acc 10) x)) '(1 2 3) :initial-value 0))
(print (reduce #'+ '((1 2) (3 4)) :key #'car))
(terpri)

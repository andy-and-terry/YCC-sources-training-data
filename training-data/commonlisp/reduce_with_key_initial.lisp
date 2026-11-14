(print (reduce #'+ '((1 a) (2 b) (3 c)) :key #'first :initial-value 100))
(print (reduce #'max '(3 9 2) :from-end t))

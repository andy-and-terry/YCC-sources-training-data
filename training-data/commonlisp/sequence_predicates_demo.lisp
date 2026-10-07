;; Higher-level sequence functions: every, some, notany, reduce, mapcan, find, count-if.
(let ((nums '(2 4 6 8))
      (mixed '(1 2 3 4)))
  (print (every #'evenp nums))
  (print (every #'evenp mixed))
  (print (some #'oddp mixed))
  (print (notany #'minusp mixed))
  (print (notevery #'evenp mixed))
  (print (find-if #'oddp mixed))
  (print (position-if #'evenp mixed))
  (print (count-if #'evenp mixed))
  (print (remove-if-not #'evenp mixed)))

;; parallel traversal of two sequences
(print (every #'< '(1 2 3) '(2 3 4)))
(print (mapcar #'+ '(1 2 3) '(10 20 30)))

;; reduce with :initial-value, :from-end and :key
(print (reduce #'+ '(1 2 3 4) :initial-value 100))
(print (reduce #'list '(1 2 3 4)))
(print (reduce #'list '(1 2 3 4) :from-end t))
(print (reduce #'max '((1 . 5) (2 . 9) (3 . 4)) :key #'cdr))

;; mapcan concatenates the lists returned by the function
(print (mapcan (lambda (x) (when (oddp x) (list x (* x x)))) '(1 2 3 4 5)))
(print (mapcan #'copy-list '((1 2) (3) (4 5))))

;; sort with :key, stable-sort keeps equal elements in order
(print (sort (copy-list '("pear" "fig" "banana" "kiwi")) #'< :key #'length))
(print (stable-sort (list '(1 . b) '(0 . a) '(1 . a) '(0 . b)) #'< :key #'car))

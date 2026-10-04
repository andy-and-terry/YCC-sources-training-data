;; Lists used as sets: union, intersection, difference, membership.
(let ((a '(1 2 3 4 5))
      (b '(4 5 6 7)))
  (print (sort (union a b) #'<))
  (print (sort (intersection a b) #'<))
  (print (sort (set-difference a b) #'<))
  (print (sort (set-exclusive-or a b) #'<))
  (print (subsetp '(1 2) a))
  (print (subsetp b a)))

;; adjoin / pushnew add only when the element is not already present
(let ((items '(a b c)))
  (print (adjoin 'b items))
  (print (adjoin 'd items))
  (pushnew 'z items)
  (pushnew 'a items)
  (print items))

;; custom equality with :test and :key
(print (union '("apple" "pear") '("Pear" "plum") :test #'string-equal))
(print (member 2.0 '(1 2 3) :test #'=))
(print (remove-duplicates '(3 1 3 2 1) :from-end t))
(print (intersection '((1 . a) (2 . b)) '((2 . x) (3 . c)) :key #'car))

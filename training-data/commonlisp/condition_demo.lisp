(defun safe-divide (a b)
  (handler-case
      (/ a b)
    (division-by-zero () :undefined)))

(print (safe-divide 10 2))
(print (safe-divide 5 0))

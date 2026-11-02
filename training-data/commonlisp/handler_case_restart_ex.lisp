(defun safe-div (a b)
  (handler-case (/ a b)
    (division-by-zero () :undefined)))
(print (list (safe-div 6 3) (safe-div 1 0)))

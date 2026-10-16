(loop for (name . age) in '(("Ann" . 31) ("Bob" . 25))
      do (format t "~a is ~a~%" name age))

(loop for (a b) on '(1 2 3 4 5 6) by #'cddr
      collect (+ a b) into sums
      finally (format t "sums: ~a~%" sums))

(loop for (key value) on '(:x 1 :y 2) by #'cddr
      do (format t "~a => ~a~%" key value))

(loop with (q r) = (multiple-value-list (floor 17 5))
      repeat 1
      do (format t "q=~a r=~a~%" q r))

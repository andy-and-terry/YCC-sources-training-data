(defun factorial (n)
  (if (<= n 1) 1 (* n (factorial (1- n)))))

(loop for i from 0 to 10 do (print (factorial i)))

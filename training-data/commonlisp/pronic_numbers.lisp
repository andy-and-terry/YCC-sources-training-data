(defun pronic-p (x)
  (let ((n (isqrt x)))
    (= x (* n (1+ n)))))

(print (loop for n below 10 collect (* n (1+ n)))) ; (0 2 6 12 20 30 42 56 72 90)
(print (list (pronic-p 56) (pronic-p 57)))         ; (T NIL)

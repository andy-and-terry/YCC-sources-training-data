(defun cube-from-odds (n)
  (let ((start (+ (- (* n n) n) 1)))
    (loop for i from 0 below n sum (+ start (* 2 i)))))

(loop for n from 1 to 5
      do (format t "~a ~a ~a~%" n (cube-from-odds n) (= (cube-from-odds n) (* n n n))))

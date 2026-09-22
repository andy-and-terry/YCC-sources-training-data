(defun rod-cutting (prices n)
  (let ((dp (make-array (1+ n) :initial-element 0)))
    (loop for i from 1 to n do
      (setf (aref dp i)
            (loop for j from 1 to i
                  maximize (+ (nth (1- j) prices) (aref dp (- i j))))))
    (aref dp n)))

(print (rod-cutting '(1 5 8 9 10 17 17 20) 8))
(print (rod-cutting '(1 5 8 9 10 17 17 20) 4))

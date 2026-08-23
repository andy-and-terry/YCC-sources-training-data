(defun knapsack (weights values capacity)
  (let* ((n (length weights))
         (dp (make-array (list (1+ n) (1+ capacity)) :initial-element 0)))
    (loop for i from 1 to n do
      (loop for w from 0 to capacity do
        (setf (aref dp i w)
              (if (<= (nth (1- i) weights) w)
                  (max (aref dp (1- i) w)
                       (+ (nth (1- i) values) (aref dp (1- i) (- w (nth (1- i) weights)))))
                  (aref dp (1- i) w)))))
    (aref dp n capacity)))

(print (knapsack '(1 3 4 5) '(1 4 5 7) 7))

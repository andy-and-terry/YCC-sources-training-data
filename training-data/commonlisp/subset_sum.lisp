(defun subset-sum-p (nums target)
  (let* ((n (length nums))
         (dp (make-array (list (1+ n) (1+ target)) :initial-element nil)))
    (loop for i from 0 to n do (setf (aref dp i 0) t))
    (loop for i from 1 to n do
      (loop for s from 1 to target do
        (setf (aref dp i s)
              (or (aref dp (1- i) s)
                  (and (<= (nth (1- i) nums) s)
                       (aref dp (1- i) (- s (nth (1- i) nums))))))))
    (aref dp n target)))

(print (subset-sum-p '(3 34 4 12 5 2) 9))
(print (subset-sum-p '(3 34 4 12 5 2) 10))

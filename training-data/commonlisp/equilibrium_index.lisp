(defun equilibrium-index (nums)
  (let ((total (reduce #'+ nums)) (left 0))
    (loop for v in nums
          for i from 0
          when (= left (- total left v)) do (return i)
          do (incf left v)
          finally (return -1))))

(print (equilibrium-index '(1 7 3 6 5 6))) ; 3

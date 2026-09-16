(defun longest-increasing-subsequence (nums)
  (let* ((n (length nums))
         (vec (coerce nums 'vector))
         (dp (make-array n :initial-element 1)))
    (loop for i from 1 below n do
      (loop for j from 0 below i do
        (when (and (< (aref vec j) (aref vec i))
                   (> (1+ (aref dp j)) (aref dp i)))
          (setf (aref dp i) (1+ (aref dp j))))))
    (loop for x across dp maximize x)))

(print (longest-increasing-subsequence '(10 9 2 5 3 7 101 18)))

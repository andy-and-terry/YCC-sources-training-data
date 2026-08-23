(defun two-sum (nums target)
  (let ((seen (make-hash-table)))
    (loop for i from 0 below (length nums) do
      (let* ((n (aref nums i)) (complement (- target n)))
        (when (gethash complement seen)
          (return-from two-sum (list (gethash complement seen) i)))
        (setf (gethash n seen) i)))
    nil))

(print (two-sum #(2 7 11 15) 9))

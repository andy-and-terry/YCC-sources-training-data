;;; Count contiguous subarrays whose sum equals k (prefix sums + hash table).
(defun count-subarrays (nums k)
  (let ((seen (make-hash-table))
        (total 0)
        (count 0))
    (setf (gethash 0 seen) 1)
    (dolist (x nums count)
      (incf total x)
      (incf count (gethash (- total k) seen 0))
      (incf (gethash total seen 0)))))

(format t "~d~%" (count-subarrays '(1 1 1) 2))

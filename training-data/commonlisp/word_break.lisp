(defun word-break-p (s word-list)
  (let* ((word-set (make-hash-table :test 'equal))
         (n (length s))
         (dp (make-array (1+ n) :initial-element nil)))
    (dolist (w word-list) (setf (gethash w word-set) t))
    (setf (aref dp 0) t)
    (loop for i from 1 to n do
      (loop for j from 0 below i do
        (when (and (aref dp j)
                   (not (aref dp i))
                   (gethash (subseq s j i) word-set))
          (setf (aref dp i) t))))
    (aref dp n)))

(print (word-break-p "leetcode" '("leet" "code")))
(print (word-break-p "catsandog" '("cats" "dog" "sand" "and" "cat")))
